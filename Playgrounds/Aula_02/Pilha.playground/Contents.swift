import UIKit

struct Pilha {
    var elementos: [Any] = []
    var topo: Int = -1
    var maxElementos: Int?
    
    init() {
        print("Pilha criada sem limite de elementos")
    }
    
    init(maxElementos: Int?) {
        if let e = maxElementos {
            self.maxElementos = e
            print("Pilha com máximo de elementos: \(e)")
        }
    }
    
    mutating func push(element e: Any) {
        if let maxElementos = maxElementos {
            if(topo >= maxElementos - 1) {
                print("Pilha cheia! não inserido o elemento \(e)")
            } else {
                self.topo += 1
                self.elementos.insert(e, at: topo)
                print("Inserindo na posição \(topo) o elemento \(e)")
            }
        } else {
            self.topo += 1
            self.elementos.insert(e, at: topo)
            print("Inserindo na posição \(topo) o elemento \(e)")
        }
    }
    
    mutating func pop() -> Any? {
        if topo == -1 {
            print("Pilha vazia!")
            return nil
        }
        let element = elementos.remove(at: topo)
        self.topo -= 1
        print("Retornando o elemento \(element)")
        return element
    }
}


var pilha = Pilha(maxElementos: 3)

pilha.push(element: 2)
pilha.push(element: 4.5)
pilha.push(element: "Testando")
pilha.push(element: true) // Vai falhar!

let a = pilha.pop()
let b = pilha.pop()
let c = pilha.pop()

if let a = a {
    print("Elemento \(a) retornado do pop")
}
if let b = b {
    print("Elemento \(b) retornado do pop")
}
if let c = c {
    print("Elemento \(c) retornado do pop")
}
pilha.pop() // Pilha já estará vazia

var pilhaSemLimite = Pilha()

for i in 0...10 {
    pilhaSemLimite.push(element: i) // Não estoura limites
}
