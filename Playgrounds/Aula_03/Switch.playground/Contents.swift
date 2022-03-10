import UIKit

let notaMedia = 9

switch notaMedia {
case 5:
    print("Nota abaixo da média: \(notaMedia)")
case 6:
    print("Nota dentro da média: \(notaMedia)")
case 10:
    print("Parabens, você atingiu a nota maxima: \(notaMedia)!")
default:
    print("Nota: \(notaMedia)")
}


switch notaMedia {
case 0:
    print("Você precisa estudar em!")
case 1...3:
    print("Ainda precisa estudar mais...")
    fallthrough // Continua validando os cases
case 4:
    print("Você está abaixo da média: 4")
case 5...:
    print("Nota boa em! top")
default:
    print("Nenhuma nota informada")
}


/*
 Enumeradores
 */
enum Aluno {
    case Joao
    case Pedro
    case Maria
}

let aluno = Aluno.Joao
print(aluno)

switch aluno {
case .Joao:
    print("Nota 6")
case .Pedro:
    print("Nota 8")
case .Maria:
    print("Nota 10")
}


enum State {
    case Success
    case Error
    case Loading
}

let state = State.Loading

switch state {
case .Success:
    print("Sucesso!")
case .Loading:
    print("Loading!")
case .Error:
    print("Error!")
@unknown default:
    print("Unknow state")
}

// Switch com tuplas
let isGoingtoRain = true
let bringUmbrella = false

switch (isGoingtoRain, bringUmbrella) {
case (true, true):
    print("☔️")
case (false, false):
    print("Não tem porque levar mesmo")
case (false, true):
    print("Uma pessoa prevenida!")
case (true, false):
    print("💦")
}

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) isn't a vowel or a consonant")
}
// Prints "e is a vowel

enum Statestr: String {
    case success = "Efetuado com sucesso"
    case failure = "Falha, tente novamente"
}
print(Statestr.success)

enum ButtonStrings: String {
    case titleButton = "Comprar"
    case titleLabel = "O texto referente"
}

let button = UIButton()
button.setTitle(ButtonStrings.titleLabel.rawValue, for: .normal)

let label = UILabel()
label.text = ButtonStrings.titleLabel.rawValue

enum Page: Int {
    case one = 1, two, three, four, blabas
    
    func getPage() -> Int {
        return self.rawValue
    }
}

var numberPage = Page.blabas
print(numberPage.getPage())

// Atribuição implícita
enum View: Int {
    case Home = 1, Favorite, Buy, about
    
    func getPage() -> Int {
        return self.rawValue
    }
}

// Valores atribuidos

struct Money {
    let value: Int
    let cents: Int
}

enum BankDeposit {
    case inValue(Money)
    case inCheck(Bool)
}

func makeDeposit(values: BankDeposit) {
    switch values {
    case .inValue(let value):
        print("O valor passado é: \(value)")
    case .inCheck(let inCheck):
        print("In Check: \(inCheck)")
    }
}

let deposit = BankDeposit.inValue(Money(value: 100, cents: 30))
makeDeposit(values: deposit)

let deposit2 = BankDeposit.inCheck(false)
makeDeposit(values: deposit2)
