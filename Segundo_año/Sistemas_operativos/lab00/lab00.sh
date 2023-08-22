
#1)
	cat /proc/cpuinfo | grep "model name" | head -n 1
	
 
#utilizo cat para mostrar el contenido de /proc/cpuinfo. Despues, utilizo grep para filtrar las líneas que contienen "model name" y por ultimo, head -n 1 muestra solo la primera línea coincidente.

	
#2)
	cat /proc/cpuinfo | grep address | wc -l

 
#utilizo cat para mostrar el contenido de /proc/cpuinfo. Despues, utilizo grep para filtrar las líneas que contienen "address" y por ultimo, wc -l muestra la cantidad de lineas que coinciden con address.


#3)
	wget -O NOMBRE_in_wonderland.txt https://www.gutenberg.org/files/11/11-0.txt

 
#utilizo wget -O para descargar un archivo y especificar el nombre personalizado del archivo descargado.

#con rm NOMBRE_in_wonderland.txt elimino el archivo


#4)
	sort -n -r -k 5 weather_cordoba.in


#con sort -n -r ordeno de mayor a menor los elementos que estan en la columna 5 [temp max] tomandolos como naturales


	sort -n -r -k 5 weather_cordoba.in | cut -d" " -f3
	

#agregando cut -d" " -f3 lo que hago es con -d selecciono como limitador " " [los espacios] y despues con -f3 que tome al tercer elemento delimitado para mostrar


	sort -n -r -k 4 weather_cordoba.in | cut -d" " -f4 | head -n 1
	

#muestro la mayor temperatura media


	sort -n -k 4 weather_cordoba.in | cut -d" " -f4 | head -n 1
	

#muestro la menor temperatura media


#5)
	sort -r -k 3 -n atpplayers.in


#ordenos los jugadores de menor puesto a mayor en el ranking 


#6)
	awk '{puntos = $2; dif_goles = $(NF-1) - $NF; print $0, puntos, dif_goles}' superliga.in | sort -r -t ' ' -k 9 -k 10 | awk '{ print $1, $2, $3, $4, $5, $6, $7, $8, $10 }'


#primero calculo dif_goles y los printeo. Despues comparo la novena columna y despues la decima y ordeno la lista y por ultimo vuelvo a imprimir la lista con todos los datos y la diferencia de goles


#7)	
	ip link | grep -i -o 'ether [0-9a-f:]*'


#'ether [0-9a-f:]*' busca líneas que contienen la palabra "ether" seguida de una dirección MAC válida en formato hexadecimal. El flag -o en grep hace que se muestren solo las coincidencias encontradas en lugar de la línea completa, por lo que mostrará solo las direcciones MAC. Además el flag -i hace que la búsqueda no le importe entre mayúsculas y minúsculas.


	ip link show | awk '/ether/ {print $2}'


#otra forma es con awk accediendo a ether printea la segunda columna


#8)	
	mkdir "Serie" && for i in {01..10}; do 
		touch Serie/fma_S01E${i}_es.srt ;
	done
	
	
#con mkdir creo un directorio llamado Serie y con touch creo los archivos fma_S0E${i}_es.srt en el directorio creado
	
	
	cd Serie/ && for i in {01..10}; do
		mv "fma_S01E${i}_es.srt" "fma_S01E${i}.srt"; 
	done && cd ..
	

#con mv cambio de nombre de archivo de uno a otro nuevo y con ${i} pongo el valor de i en el nombre














