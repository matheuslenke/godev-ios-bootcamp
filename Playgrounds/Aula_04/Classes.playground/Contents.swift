import UIKit

/*
 Classes
 */

class Person {
    var name: String
    var lastName: String
    var age: Int
    
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }
    
    func welcome() {
        print("Seja bem vindo, \(name) \(lastName)")
    }
}

let person = Person(name: "Matheus", lastName: "Lenke", age: 23)
let personCopy = person
person.name = "Luis"
person.welcome()
personCopy.welcome()

/*
 Structs
*/

struct PersonStruct {
    var name: String
    var lastName: String
    var age: Int
    
    func welcome() {
        print("Seja bem vindo, \(name) \(lastName)")
    }
    
    mutating func changeName(newName: String) {
        self.name = newName
    }
}
// Construtor criado automaticamente
var person2 = PersonStruct(name: "Matheus", lastName: "Lenke", age: 23)
let person2Copy = person2
person2.changeName(newName: "Luna")

person2.welcome()
person2Copy.welcome()

class CustomButton: UIButton {
    
}

let button: CustomButton = CustomButton(type: .close)


class Animal {
    fileprivate var comendo = false
    func comer() {
        
    }
}

class Dog: Animal {
    override func comer() {
        self.comendo = true
    }
}
