import UIKit

// Incrementos e operadores lógicos

let num1 = 10
let num2 = 20

let compair = num1 < num2
print("Compair: \(compair)")

let name = "Matheus"
let lastName = "Lenke"

let res = name < lastName

print("Res: \(res)")

/*
 = Atribuição
 == Comparação
 != Diferente de
 < Menor
 <= Menor igual a
 > Maior
 >= Maior igual a
 */

// Expressões

// ! Operador de inversão

var isHidden: Bool = true
isHidden = !isHidden

print("isHidden: \(isHidden)")

/*
 || Or
 && And
 */
let isEnabled: Bool = true

let boolCompare = isHidden || isEnabled
print("BoolCompare: \(boolCompare)")

/*
 += Incremento
 -= Decremento
 */

var numIncrement = 10
numIncrement += 1
print("NumIncrement: \(numIncrement)")
numIncrement -= 1
print("NumIncrement: \(numIncrement)")
