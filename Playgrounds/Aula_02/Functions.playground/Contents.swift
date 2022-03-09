import UIKit

func myCar() {
    print("Meu carro")
}

func myCar(name: String) {
    print("Meu carro de nome \(name)")
}

myCar()
myCar(name: "Fusca")


func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(person: "Matheus"))

func myName(name first: String, surname last: String) {
    print("My name is \(first) \(last)")
}
myName(name: "Matheus", surname: "Lenke")

func myAge(age: Int) {
    print("I am \(age) years old")
}
myAge(age: 23)

var ages: [Int] = [1,2,3,4,5]

ages.forEach { age in
    print("Age is \(age)")
}

let myFunction: () -> Void

typealias FullName = String

func getName(name: String) -> FullName {
    name
}
print(getName(name: "Lenke"))

func getPerson(name: String, lastName: String) -> (String, String) {
    return (name, lastName)
}

/*
 Closures
 */

let AnonymousGetPerson = { (name: String, lastName: String) -> (String, String) in
    return (name, lastName)
}

print(AnonymousGetPerson("Matheus", "Lenke"))

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

struct Person {
    var name: String?
    var age: Int
}

func makeBuy(value: Int, onCompletion: (Person) -> Void) {
    let person = Person(name: "Matheus", age: 23)
    onCompletion(person)
}

makeBuy(value: 20) { res in
    print("res: \(res)")
}

typealias onCompletion = (String) -> Void
typealias onCompletionError = (String) -> Void

func makeBuyProduct(isValid: Bool,
                    onCompletion: onCompletion,
                    error: onCompletionError) {
    if isValid {
        onCompletion("Lenke")
    } else {
        error("Error!")
    }
}

makeBuyProduct(isValid: false) { success in
    print("Succes! \(success)")
} error: { error in
    print("Error! \(error)")
    // Tratativas do erro para exibir para o usuário a resposta
}

