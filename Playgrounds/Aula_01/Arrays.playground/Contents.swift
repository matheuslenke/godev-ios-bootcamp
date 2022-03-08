import UIKit

/*
 Coleção de dados - Array
 */

var tupla: (String, Int, Bool) = ("Lenke", 12, false)

var cars: [String] = ["Fusca", "Ferrari", "Audi A3", "Celta", "Marea Turbo"] // Array de String

let number: [Int] = [1, 5, 6, 7, 8] // Array de Int

var any = [1, 2, 3 ,"Teste"] as Any // Array heterogêneo, precisa de casting para Any (não recomendado)

cars.append("Gol")
print(cars)

cars.insert("Etios", at: 0)
print(cars)

cars.removeLast()
print(cars)

cars.remove(at: cars.count - 1)
print(cars)

cars.removeFirst()
print(cars)

cars.removeAll()
print(cars)

