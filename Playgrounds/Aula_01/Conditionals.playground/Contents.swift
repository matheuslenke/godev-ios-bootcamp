import UIKit

let isHidden = false
let isEnabled = false


if isHidden {
    print("Caso verdadeiro")
} else if isEnabled {
    print("Caso verdadeiro: isEnabled")
} else {
    print("Caso falso 2")
}

var system: String

let company: String = "Apple"


if company == "Apple" {
    system = "iOS"
} else {
    system = "Android"
}

print(system)


system = company == "Apple" ? "iOS" : "Android"
