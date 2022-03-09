import UIKit

var message: String?

message = "Minha mensagem"
//print(message ?? "a")

// Sem o if let
if message != nil {
    print(message!)
} else {
    print("Valor nulo!")
}

// If let
if let message = message {
    print(message)
}

// Early exit --> Guard let
func doSomething() {
    var number: Int?
    number = 2
    guard let numberValue = number else { return }
    print("Não executa aqui se for nulo: \(numberValue)")
}

doSomething()
