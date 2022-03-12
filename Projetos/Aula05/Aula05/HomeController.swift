//
//  ViewController.swift
//  Aula05
//
//  Created by Matheus Lenke on 11/03/22.
//

import UIKit

class HomeController: UIViewController {

    
    // MARK: - Properties IBOutlet
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var authenticatorButton: UIButton!
    
    // MARK: - Public Properties

    // MARK: - Private Properties
    private let validEmail: String = "matheuslenke@gmail.com"
    private let validPassword: String = "123456"
    
    // MARK: - Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        authenticatorButton.layer.cornerRadius = 10
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - IBActions
    
    @IBAction func pressedAuthentication(_ sender: UIButton) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            print("Dados informados para autenticar: \(email) \(password)")
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
    
    // MARK: - Auxiliary functions
    
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

// MARK: - UITextFieldDelegate

extension HomeController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - String extensions

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
