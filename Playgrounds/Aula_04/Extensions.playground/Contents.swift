import UIKit

protocol Nota {
    func notaAluno()
}

protocol Materia {
    func materiaAluno()
}

class Aluno {
    var name: String?
    
    func getName() -> String {
        guard let name = name else { return ""}
        return name
    }
}

extension Aluno: Nota {
    func notaAluno() {
    }
}

extension Aluno: Materia {
    func materiaAluno() {
    }
}

extension Aluno {
    func setAluno(name: String) {
        self.name = name
    }
}

var nome = "matheus lenke coutinho"
print(nome.uppercased())

let str = "treinamento de iOS"

// Fazendo extension
extension String {
    func capitalizeFirst() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

print(str.capitalizeFirst())

extension UIColor {
    static let surfaceGray = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
    
    static let lightBlue = UIColor(red: 0.32, green: 0.66, blue: 1.00, alpha: 1.00)
}

let color: UIColor = .surfaceGray
let color2: UIColor = .lightBlue

extension UIImage {
    static let iconApple = UIImage(named: "appleIcon.png")
}

func icon() -> UIImage {
    guard let image: UIImage = .iconApple else {
        return UIImage(systemName: "airplane")!
    }
    return image
}

let image = icon()
