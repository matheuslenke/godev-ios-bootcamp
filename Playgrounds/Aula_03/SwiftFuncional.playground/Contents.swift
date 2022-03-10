import UIKit

/*
 Sort
 */
var estudantes = ["Samuel", "Matheus", "Lenke", "Ana", "Maria", "João"]

print(estudantes.sorted())

/*
 LHS -> Left Hand Side
 RHS -> Right Hand Side
 */

estudantes.sort { (lhs: String, rhs: String) -> Bool in
    lhs.lowercased() < rhs.lowercased()
}
print(estudantes)

let descending =  estudantes.sorted(by: >)
print(descending)

let ascending =  estudantes.sorted(by: <)
print(ascending)


/*
 Merge de dados
 */
let array1 = [1,2,5,6,1,2,3]
let array2 = [10,20,50,40,30,100]

let flattenArray = array1 + array2

print(flattenArray)

/*
 Map
 */

let alunosNotas = [4, 5, 6, 9, 3, 7, 8, 7]

var novaNota: [Int] = alunosNotas.map { item in
    item + 1
}
novaNota = alunosNotas.map { $0 + 1 }
print(alunosNotas, novaNota)

/*
 Filter
 */

var aprovadosNotas: [Int] = []

//for nota in alunosNotas {
//    if nota >= 6 {
//        aprovadosNotas.append(nota)
//    }
//}
//print(aprovadosNotas)
aprovadosNotas = alunosNotas.filter { res in
    res >= media
}
print(aprovadosNotas)
let media = 6
aprovadosNotas = alunosNotas.filter { $0 >= media }
print(aprovadosNotas)


/*
 Reduce
 */

var soma = 0

var notas = [4,5,6,8,10]

soma = notas.reduce(0, { $0 + $1 })

print("A soma é: \(soma)")

// Reduce com tipo composto
struct Point {
    var x: Int
    var y: Int
    var z: Int
}
let point1 = Point(x: 1, y: 2, z: 3)
let point2 = Point(x: 4, y: 5, z: 6)
let arrayPoints = [point1, point2]
let result = arrayPoints.reduce(Point(x: 0, y: 0, z: 0)) { ( accumulator, nextValue) in
    let x = accumulator.x + nextValue.x
    let y = accumulator.y + nextValue.y
    let z = accumulator.z + nextValue.z
    return Point(x: x, y: y, z: z)
}
print(result)
