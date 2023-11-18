/*
 * fat_fuse_ops.c
 *
 * FAT32 filesystem operations for FUSE (Filesystem in Userspace)
 */

#include "big_brother.h"
#include "fat_fuse_ops.h"
#include "fat_file.h"
#include "fat_filename_util.h"
#include "fat_fs_tree.h"
#include "fat_util.h"
#include "fat_volume.h"
#include <alloca.h>
#include <errno.h>
#include <gmodule.h>
#include <libgen.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

/* Retrieve the currently mounted FAT volume from the FUSE context. */
static inline fat_volume get_fat_volume() {
    return fuse_get_context()->private_data;
}

#define LOG_MESSAGE_SIZE 100
#define DATE_MESSAGE_SIZE 30

// Agrego esto para poder utilizar esta funcion en fat_fuse_create_fslog
static void fat_fuse_log_activity(char *operation_type, fat_file file);

// Funcion para crear el archivo fs.log
static int fat_fuse_create_fslog(void) {

    // Creo las variables
    fat_volume vol;
    fat_tree_node file_node;
    fat_file file;
    fat_file parent;
    
    errno = 0;

    vol = get_fat_volume();
    file_node = fat_tree_node_search(vol->file_tree, LOG_FILE);

    // Reviso si ya existe el archivo
    if (file_node != NULL) {

        DEBUG("ERROR: fs.log already exists");
        return -errno;
    }

    // Como no existe, lo creamos
    int error = fat_fuse_mknod(LOG_FILE, 0, 0);

    // Reviso que no falle la creacion del archivo
    if (error != 0) {

        DEBUG("ERROR: Cant create fs.log");
        return -errno;
    }

    file_node = fat_tree_node_search(vol->file_tree, LOG_FILE);

    if (file_node == NULL) {

        DEBUG("ERROR: Cant find fs.log node");
        return -errno;
    }

    file = fat_tree_get_file(file_node);

    if (file == NULL) {

        DEBUG("ERROR: Cant find fs.log");
        return -errno;
    }

    parent = fat_tree_get_parent(file_node);

    if (parent == NULL) {

        DEBUG("ERROR: Cant find fs.log parent");
        return -errno;
    }

    // Registro la inicializacion del archivo
    fat_fuse_log_activity("INIT" , file);

    // Ocultamos el archivo para otros FS
    fat_file_hide(file, parent);

    return 0;
}

void now_to_str(char *buf) {
    time_t now = time(NULL);
    struct tm *timeinfo;
    timeinfo = localtime(&now);

    strftime(buf, DATE_MESSAGE_SIZE, "%d-%m-%Y %H:%M", timeinfo);
}

void fat_fuse_log_activity(char *operation_type, fat_file target_file) {

    char buf[LOG_MESSAGE_SIZE] = "";
    now_to_str(buf);
    strcat(buf, "\t");
    strcat(buf, getlogin());
    strcat(buf, "\t");
    strcat(buf, target_file->filepath);
    strcat(buf, "\t");
    strcat(buf, operation_type);
    strcat(buf, "\n");

    // Agregamos el mensaje en fs.log
    fat_volume vol;
    fat_tree_node file_node;
    fat_file file , file_parent;
    off_t offset;
    int size;

    vol = get_fat_volume();

    file_node = fat_tree_node_search(vol->file_tree, LOG_FILE);

    file = fat_tree_get_file(file_node);

    file_parent = fat_tree_get_parent(file_node);

    offset = file->dentry->file_size;

    size = strlen(buf);

    // Escribo el texto en el archivo fs.log
    fat_file_pwrite(file , buf , size , offset , file_parent);
}

/* Get file attributes (file descriptor version) */
int fat_fuse_fgetattr(const char *path, struct stat *stbuf,
                      struct fuse_file_info *fi) {
    fat_file file = (fat_file)fat_tree_get_file((fat_tree_node)fi->fh);
    fat_file_to_stbuf(file, stbuf);
    return 0;
}

/* Get file attributes (path version) */
int fat_fuse_getattr(const char *path, struct stat *stbuf) {
    fat_volume vol;
    fat_file file;

    vol = get_fat_volume();
    file = fat_tree_search(vol->file_tree, path);
    if (file == NULL) {
        errno = ENOENT;
        return -errno;
    }
    fat_file_to_stbuf(file, stbuf);
    return 0;
}

/* Open a file */
int fat_fuse_open(const char *path, struct fuse_file_info *fi) {
    fat_volume vol;
    fat_tree_node file_node;
    fat_file file;

    vol = get_fat_volume();
    file_node = fat_tree_node_search(vol->file_tree, path);
    if (!file_node)
        return -errno;
    file = fat_tree_get_file(file_node);
    if (fat_file_is_directory(file))
        return -EISDIR;
    fat_tree_inc_num_times_opened(file_node);
    fi->fh = (uintptr_t)file_node;
    return 0;
}

/* Open a directory */
int fat_fuse_opendir(const char *path, struct fuse_file_info *fi) {
    fat_volume vol = NULL;
    fat_tree_node file_node = NULL;
    fat_file file = NULL;

    vol = get_fat_volume();
    file_node = fat_tree_node_search(vol->file_tree, path);
    if (file_node == NULL) {
        return -errno;
    }
    file = fat_tree_get_file(file_node);
    if (!fat_file_is_directory(file)) {
        return -ENOTDIR;
    }
    fat_tree_inc_num_times_opened(file_node);
    fi->fh = (uintptr_t)file_node;
    return 0;
}

/* Read directory children. Calls function fat_file_read_children which returns
 * a list of files inside a GList. The children were read from the directory
 * entries in the cluster of the directory.
 * This function iterates over the list of children and adds them to the
 * file tree.
 * This operation should be performed only once per directory, the first time
 * readdir is called.
 */
static void fat_fuse_read_children(fat_tree_node dir_node) {
    fat_volume vol = get_fat_volume();
    fat_file dir = fat_tree_get_file(dir_node);
    GList *children_list = fat_file_read_children(dir);
    // Add child to tree. TODO handle duplicates
    for (GList *l = children_list; l != NULL; l = l->next) {
        vol->file_tree =
            fat_tree_insert(vol->file_tree, dir_node, (fat_file)l->data);
    }
}

/* Add entries of a directory in @fi to @buf using @filler function. */
int fat_fuse_readdir(const char *path, void *buf, fuse_fill_dir_t filler,
                     off_t offset, struct fuse_file_info *fi) {
    errno = 0;
    fat_tree_node dir_node = (fat_tree_node)fi->fh;
    fat_file dir = fat_tree_get_file(dir_node);
    fat_file *children = NULL, *child = NULL;
    int error = 0;

    // Insert first two filenames (. and ..)
    if ((*filler)(buf, ".", NULL, 0) || (*filler)(buf, "..", NULL, 0)) {
        return -errno;
    }
    if (!fat_file_is_directory(dir)) {
        errno = ENOTDIR;
        return -errno;
    }
    if (dir->children_read != 1) {
        fat_fuse_read_children(dir_node);
        if (errno < 0) {
            return -errno;
        }
    }

    children = fat_tree_flatten_h_children(dir_node);
    child = children;
    while (*child != NULL) {

        // Aca es donde escondemos los archivos
        // si es el archivo fs.log, no lo agrego a los archivos visibles
        if(!is_log_filepath((*child)->filepath)){

            error = (*filler)(buf, (*child)->name, NULL, 0);
            if (error != 0) {
                return -errno;
            }
        }

        child++;
    }

    // La idea de usar simplemente mknod no funciono
    // Debo hacer la creacion del archivo mas robusto
    fat_fuse_create_fslog();

    return 0;
}

/* Read data from a file */
int fat_fuse_read(const char *path, char *buf, size_t size, off_t offset,
                  struct fuse_file_info *fi) {
    errno = 0;
    int bytes_read;
    fat_tree_node file_node = (fat_tree_node)fi->fh;
    fat_file file = fat_tree_get_file(file_node);
    fat_file parent = fat_tree_get_parent(file_node);

    bytes_read = fat_file_pread(file, buf, size, offset, parent);
    if (errno != 0) {
        return -errno;
    }

    // Vigilamos las llamadas a read
    fat_fuse_log_activity("read" , file);

    return bytes_read;
}

/* Write data from a file */
int fat_fuse_write(const char *path, const char *buf, size_t size, off_t offset,
                   struct fuse_file_info *fi) {
    fat_tree_node file_node = (fat_tree_node)fi->fh;
    fat_file file = fat_tree_get_file(file_node);
    fat_file parent = fat_tree_get_parent(file_node);

    if (size == 0)
        return 0; // Nothing to write
    if (offset > file->dentry->file_size)
        return -EOVERFLOW;

    // Vigilamos las llamadas a write
    fat_fuse_log_activity("write" , file);
    
    return fat_file_pwrite(file, buf, size, offset, parent);
}

/* Close a file */
int fat_fuse_release(const char *path, struct fuse_file_info *fi) {
    fat_tree_node file = (fat_tree_node)fi->fh;
    fat_tree_dec_num_times_opened(file);
    return 0;
}

/* Close a directory */
int fat_fuse_releasedir(const char *path, struct fuse_file_info *fi) {
    fat_tree_node file = (fat_tree_node)fi->fh;
    fat_tree_dec_num_times_opened(file);
    return 0;
}

int fat_fuse_mkdir(const char *path, mode_t mode) {
    errno = 0;
    fat_volume vol = NULL;
    fat_file parent = NULL, new_file = NULL;
    fat_tree_node parent_node = NULL;

    // The system has already checked the path does not exist. We get the parent
    vol = get_fat_volume();
    parent_node = fat_tree_node_search(vol->file_tree, dirname(strdup(path)));
    if (parent_node == NULL) {
        errno = ENOENT;
        return -errno;
    }
    parent = fat_tree_get_file(parent_node);
    if (!fat_file_is_directory(parent)) {
        fat_error("Error! Parent is not directory\n");
        errno = ENOTDIR;
        return -errno;
    }

    // init child
    new_file = fat_file_init(vol->table, true, strdup(path));
    if (errno != 0) {
        return -errno;
    }
    // insert to directory tree representation
    vol->file_tree = fat_tree_insert(vol->file_tree, parent_node, new_file);
    // write file in parent's entry (disk)
    fat_file_dentry_add_child(parent, new_file);
    return -errno;
}

/* Creates a new file in @path. @mode and @dev are ignored. */
int fat_fuse_mknod(const char *path, mode_t mode, dev_t dev) {
    errno = 0;
    fat_volume vol;
    fat_file parent, new_file;
    fat_tree_node parent_node;

    // The system has already checked the path does not exist. We get the parent
    vol = get_fat_volume();
    parent_node = fat_tree_node_search(vol->file_tree, dirname(strdup(path)));
    if (parent_node == NULL) {
        errno = ENOENT;
        return -errno;
    }
    parent = fat_tree_get_file(parent_node);
    if (!fat_file_is_directory(parent)) {
        fat_error("Error! Parent is not directory\n");
        errno = ENOTDIR;
        return -errno;
    }
    new_file = fat_file_init(vol->table, false, strdup(path));
    if (errno < 0) {
        return -errno;
    }
    // insert to directory tree representation
    vol->file_tree = fat_tree_insert(vol->file_tree, parent_node, new_file);
    // Write dentry in parent cluster
    fat_file_dentry_add_child(parent, new_file);
    return -errno;
}

int fat_fuse_utime(const char *path, struct utimbuf *buf) {
    errno = 0;
    fat_file parent = NULL;
    fat_volume vol = get_fat_volume();
    fat_tree_node file_node = fat_tree_node_search(vol->file_tree, path);
    if (file_node == NULL || errno != 0) {
        errno = ENOENT;
        return -errno;
    }
    parent = fat_tree_get_parent(file_node);
    if (parent == NULL || errno != 0) {
        DEBUG("WARNING: Setting time for parent ignored");
        return 0; // We do nothing, no utime for parent
    }
    fat_utime(fat_tree_get_file(file_node), parent, buf);
    return -errno;
}

/* Shortens the file at the given offset.*/
int fat_fuse_truncate(const char *path, off_t offset) {
    errno = 0;
    fat_volume vol = get_fat_volume();
    fat_file file = NULL, parent = NULL;
    fat_tree_node file_node = fat_tree_node_search(vol->file_tree, path);
    if (file_node == NULL || errno != 0) {
        errno = ENOENT;
        return -errno;
    }
    file = fat_tree_get_file(file_node);
    if (fat_file_is_directory(file))
        return -EISDIR;

    parent = fat_tree_get_parent(file_node);
    fat_tree_inc_num_times_opened(file_node);
    fat_file_truncate(file, offset, parent);
    return -errno;
}

/* Remove a file */
int fat_fuse_unlink(const char *path) {
    
    //copie la implementacion de truncate pero cambiando algunos detalles

    errno = 0;

    //Recupere el volumen FAT actualmente montado del contexto FUSE.
    fat_volume vol = get_fat_volume();

    fat_file file = NULL, parent = NULL;                                       
    
    //Devuelve una referencia al nodo (del árbol interno) que coincide con path
    fat_tree_node file_node = fat_tree_node_search(vol->file_tree, path);
    
    //me pregunto si existe el directorio
    if (file_node == NULL || errno != 0) {
        errno = ENOENT;
        return -errno;
    }

    //me pregunto si mi file es un directorio o un archivo
    file = fat_tree_get_file(file_node);
    if (fat_file_is_directory(file)){
        return -EISDIR;
    }
    
    //asigno a parent el padre de mi file
    parent = fat_tree_get_parent(file_node); 
    
    //hasta aqui no tocamos casi nada nada del truncate lo dejamos todo igual lo unico que hay que modificar son las ultimas 2 lineas
    //de codigo las cuales son usar un unlink para eleminar nuestro cluster el cual se implementara en fat_file.c
    
    //aqui laburo en los cluster con programacion de bajo nivel
    fat_file_unlink(file, parent); 

    //elimino mi arbol
    fat_tree_delete(vol->file_tree,path);
    
    return -errno;
}

/* Remove a directory */
int fat_fuse_rmdir(const char *path) {

    //La implementacion de fat_fuse_rmdir es igual que la unlink solo que en vez de eliminar un file eliminamos un directory
    //su implementacion es muy parecida a fat_fuse_unlink solo que tengo que ver si mi directorio esta vacio

    errno = 0;

    fat_volume vol = get_fat_volume();
    
    fat_file file = NULL, parent = NULL;
    
    fat_tree_node file_node = fat_tree_node_search(vol->file_tree, path);

    //me pregunto si existe el directorio o archivo
    if (file_node == NULL || errno != 0) {
        errno = ENOENT;
        return -errno;
    }

   //me pregunto si mi file es un directorio o un archivo
    file = fat_tree_get_file(file_node);
    if (!fat_file_is_directory(file)){
        errno = ENOTDIR;
        return -errno;
    }

    //si es un directorio tengo que preguntarme si esta vacio
    if(file->dir.nentries != 0){
        //si no es vacio devuelvo ENOTEMPTY que significa Directory not empty
        return -ENOTEMPTY;
    }

    // Hago un recorrido manual para ver si esta vacio
    // Vimos que lo de arriba en algunos casos falla
    // Si el directorio estuviese vacio, entonces no deberia de tener hijos
    // (la implementacion fue idea de un compañero)
    GList *childrens = fat_file_read_children(file);
    bool is_empty = g_list_length(childrens) == 0;
    g_list_free(childrens);
    if (!is_empty) {
        errno = ENOTEMPTY;
        return -errno;
    }

    parent = fat_tree_get_parent(file_node);

    fat_file_unlink(file, parent);
    fat_tree_delete(vol->file_tree, path);

    return -errno;
}
