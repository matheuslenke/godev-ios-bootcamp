//
//  ViewController.swift
//  Aula05
//
//  Created by Matheus Lenke on 11/03/22.
//

import UIKit

class HomeController: UIViewController {

    let validEmail: String = "matheuslenke@gmail.com"
    let validPassword: String = "123456"
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var authenticatorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedAuthentication(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            print("Dados informados para autenticar: \(email) \(password)")
            self.view.endEditing(false)
            if email.isEmpty || password.isEmpty {
                displayAlert(title: "Falha", message: "Dados vazios!", preferredStyle: .alert)
                return
            }
            validateEmail(email: email)
            if(email == validEmail && password == validPassword) {
                displayAlert(title: "Sucesso", message: "Login efetuado com sucesso", preferredStyle: .alert)
            } else {
                displayAlert(title: "Falha", message: "Dados incorretos!", preferredStyle: .alert)
            }
        }
        else {
            displayAlert(title: "Falha", message: "Por favor tente novamente", preferredStyle: .alert)
        }
    }
    
    func displayAlert(title: String, message: String, preferredStyle: UIAlertController.Style ) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Confirmar", style: .default))
        self.present(ac, animated: true)
    }
    
    func validateEmail(email: String) {
        if !email.isValidEmail() {
            displayAlert(title: "Falha", message: "Email em formato inválido", preferredStyle: .alert)
        }
    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
