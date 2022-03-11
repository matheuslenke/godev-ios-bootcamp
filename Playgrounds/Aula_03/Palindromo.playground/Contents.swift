import UIKit

// <--- Palíndromos --->
// reler, rever, reviver, rir, socos, radar

func checkPalindromo(word: String) -> Bool {
    var mirroredWord = ""
    var wordArray: [String.Element] = []

    // Criando um array com cada caracter
    word.forEach({ char in
        wordArray.append(char)
    })
    
    // Criando a string espelhada
    let wordSize = wordArray.count
    for i in 0...wordSize - 1 {
        mirroredWord.append(wordArray[wordSize - 1 - i])
    }

    if (mirroredWord == word) {
        print("A palavra \(word) é um palíndromo!")
        return true
    }
    print("A palavra \(word) não é um palíndromo!")
    return false
}

checkPalindromo(word: "testando")
checkPalindromo(word: "ovo")
checkPalindromo(word: "reler")
checkPalindromo(word: "rever")
checkPalindromo(word: "rir")
checkPalindromo(word: "godev")
checkPalindromo(word: "idwall")

func checkPalindromoOtimizado(word: String) -> Bool {
    let mirroredWord = String(word.reversed()).lowercased().trimmingCharacters(in: .whitespaces)
    if (mirroredWord == word) {
        print("A palavra \(word) é um palíndromo!")
        return true
    }
    print("A palavra \(word) não é um palíndromo!")
    return false
}

checkPalindromoOtimizado(word: "testando odnatset")
checkPalindromoOtimizado(word: "ovo")
checkPalindromoOtimizado(word: "reler")
checkPalindromoOtimizado(word: "rever")
checkPalindromoOtimizado(word: "rir")
checkPalindromoOtimizado(word: "godev")
checkPalindromoOtimizado(word: "idwall")
