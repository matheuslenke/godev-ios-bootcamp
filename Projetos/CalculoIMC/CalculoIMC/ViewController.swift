//
//  ViewController.swift
//  CalculoIMC
//
//  Created by Matheus Lenke on 12/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        // Do any additional setup after loading the view.
    }
    
    private func delegates() {
        heightTextField.delegate = self
        weightTextField.delegate = self
    }

    @IBAction func pressedCalcular(_ sender: UIButton) {
        if var weight = weightTextField.text, var height = heightTextField.text {
            weight = weight.replacingOccurrences(of: ",", with: ".")
            height = height.replacingOccurrences(of: ",", with: ".")
            
            guard let heightDouble = Double(height) else { return }
            guard let weightDouble = Double(weight) else { return }
            
            let imc = calculateIMC(weight: weightDouble, height: heightDouble)
            
            showResults(imc: imc)
            
        } else {
            print("Valores vazios")
        }
    }
    
    func calculateIMC(weight: Double, height: Double) -> Double {
        let imc = weight / pow(height, 2)
        
        return Double(round(10 * imc) / 10)
    }
    
    func showResults(imc: Double) {
        var message = ""
        switch imc {
        case 0..<18.5:
            message = "Você está abaixo do seu peso ideal"
        case 18.5..<25:
            message = "Você está no seu peso ideal"
        case 25..<30:
            message = "Você está com sobrepeso"
        case 30..<35:
            message = "Você está com obesidade grau 1"
        case 35..<40:
            message = "Você está com obesidade grau 2"
        case 40...:
            message = "Você está com obesidade grau 3"
        default:
            message = "Valor de IMC inválido!"
        }
        
        
        let alert = UIAlertController(title: "Seu IMC é: \(imc)", message: message, preferredStyle: .alert)
                
        alert.addAction(UIAlertAction(title: "Confirma", style: .default, handler: { _ in
            self.weightTextField.text = ""
            self.heightTextField.text = ""
        }))
        
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

