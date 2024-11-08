// Parcial 2 - MongoDB - Soluciones
// Fecha: 2023-11-17

// Ejercicio 1
// Buscar ventas en "London", "Austin" o "San Diego" para clientes con edad >= 18, 
// que incluyan productos con precio mínimo de 1000 y etiquetados como "school" o "kids".
// Mostrar: id (como "sale"), saleDate, storeLocation, y email del cliente.

db.sales.find({
    storeLocation: { $in: ["London", "Austin", "San Diego"] },
    "customer.age": { $gte: 18 },
    items: {
      $elemMatch: {
        price: { $gte: 1000 },
        tags: { $in: ["school", "kids"] }
      }
    }
  }, {
    _id: 0,
    sale: "$_id",
    saleDate: 1,
    storeLocation: 1,
    "customer.email": 1
  })
  
  // Ejercicio 2
  // Buscar ventas en "Seattle" donde el método de compra sea "In store" o "Phone" y 
  // realizadas entre 1 de febrero de 2014 y 31 de enero de 2015.
  // Mostrar: email, satisfacción del cliente y monto total (price * quantity).
  // Ordenar por satisfacción (descendente), y en caso de empate, por email (alfabéticamente).
  
  db.sales.aggregate([
    {
      $match: {
        storeLocation: "Seattle",
        purchaseMethod: { $in: ["In store", "Phone"] },
        saleDate: { $gte: ISODate("2014-02-01"), $lte: ISODate("2015-01-31") }
      }
    },
    {
      $addFields: {
        totalAmount: {
          $sum: {
            $map: {
              input: "$items",
              as: "item",
              in: { $multiply: ["$$item.price", "$$item.quantity"] }
            }
          }
        }
      }
    },
    {
      $project: {
        _id: 0,
        "customer.email": 1,
        satisfaction: 1,
        totalAmount: 1
      }
    },
    { $sort: { satisfaction: -1, "customer.email": 1 } }
  ])
  
  // Ejercicio 3
  // Crear vista salesInvoiced para calcular monto mínimo, máximo, total y promedio facturado
  // por año y mes, en orden cronológico.
  
  db.sales.aggregate([
    {
      $addFields: {
        yearMonth: {
          $dateToString: { format: "%Y-%m", date: "$saleDate" }
        },
        totalAmount: {
          $sum: {
            $map: {
              input: "$items",
              as: "item",
              in: { $multiply: ["$$item.price", "$$item.quantity"] }
            }
          }
        }
      }
    },
    {
      $group: {
        _id: "$yearMonth",
        minAmount: { $min: "$totalAmount" },
        maxAmount: { $max: "$totalAmount" },
        totalAmount: { $sum: "$totalAmount" },
        avgAmount: { $avg: "$totalAmount" }
      }
    },
    { $sort: { _id: 1 } }
  ])
  
  // Ejercicio 4
  // Mostrar storeLocation, venta promedio de cada tienda, el objetivo de ventas de la colección storeObjectives,
  // y la diferencia entre el promedio y el objetivo.
  
  db.sales.aggregate([
    {
      $group: {
        _id: "$storeLocation",
        avgSale: { $avg: { $sum: { $map: { input: "$items", as: "item", in: { $multiply: ["$$item.price", "$$item.quantity"] } } } } }
      }
    },
    {
      $lookup: {
        from: "storeObjectives",
        localField: "_id",
        foreignField: "storeLocation",
        as: "objectiveData"
      }
    },
    { $unwind: "$objectiveData" },
    {
      $project: {
        storeLocation: "$_id",
        avgSale: 1,
        objective: "$objectiveData.objective",
        difference: { $subtract: ["$avgSale", "$objectiveData.objective"] }
      }
    }
  ])
  
  // Ejercicio 5
  // Definir reglas de validación para la colección "sales" usando JSON Schema.
  
  // a. Reglas de validación para los campos: saleDate, storeLocation, purchaseMethod, y customer (con sus campos anidados).
  db.createCollection("sales", {
    validator: {
      $jsonSchema: {
        bsonType: "object",
        required: ["saleDate", "storeLocation", "purchaseMethod", "customer"],
        properties: {
          saleDate: { bsonType: "date" },
          storeLocation: { bsonType: "string" },
          purchaseMethod: { enum: ["In store", "Online", "Phone"] },
          customer: {
            bsonType: "object",
            required: ["age", "email"],
            properties: {
              age: { bsonType: "int", minimum: 0 },
              email: { bsonType: "string", pattern: "^.+@.+\\..+$" }
            }
          }
        }
      }
    }
  })
  
  // b. Casos de prueba para las reglas de validación:
  
  // Caso de éxito: Documento que cumple con las reglas.
  db.sales.insertOne({
    saleDate: new Date(),
    storeLocation: "New York",
    purchaseMethod: "In store",
    customer: { age: 30, email: "test@example.com" }
  })
  
  // Caso de falla: Documento que no cumple (edad negativa).
  db.sales.insertOne({
    saleDate: new Date(),
    storeLocation: "New York",
    purchaseMethod: "In store",
    customer: { age: -5, email: "test@example.com" }
  })
