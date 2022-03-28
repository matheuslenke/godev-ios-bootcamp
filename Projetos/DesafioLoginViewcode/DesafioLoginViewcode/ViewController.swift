//
//  ViewController.swift
//  DesafioLoginViewcode
//
//  Created by Matheus Lenke on 28/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Private Properties
    private let orangeColor: UIColor = UIColor(red: 240/255, green: 81/255, blue: 56/255, alpha: 1)
    private let validEmail: String = "matheuslenke@gmail.com"
    private let validPassword: String = "123456"
    
    // MARK: - UI Elements

    lazy var headerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "SwiftLogo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var verticalEmailStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Informe seu E-mail"
        label.textColor = orangeColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.textContentType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var verticalPasswordStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Informe sua senha"
        label.textColor = orangeColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.borderStyle = .roundedRect
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var authenticateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Autenticar", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = orangeColor
        button.addTarget(self, action: #selector(pressedAuthentication), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    // MARK: - UI Configurations
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerImage)
        configHeaderImage()
        
        view.addSubview(logoImage)
        configLogoImage()
        
        view.addSubview(verticalEmailStackView)
        configVerticalEmailStackView()
        
        view.addSubview(verticalPasswordStackView)
        configVerticalPasswordStackView()
        
        view.addSubview(authenticateButton)
        configAuthenticateButton()
        
    }
    
    private func configHeaderImage() {
        NSLayoutConstraint.activate([
            headerImage.topAnchor.constraint(equalTo: view.topAnchor),
            headerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImage.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    private func configLogoImage() {
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.bottomAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: -30),
            logoImage.heightAnchor.constraint(equalToConstant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configVerticalEmailStackView() {
        verticalEmailStackView.addArrangedSubview(emailLabel)
        verticalEmailStackView.addArrangedSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            verticalEmailStackView.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 30),
            verticalEmailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            verticalEmailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            emailLabel.heightAnchor.constraint(equalToConstant: 15),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 45)

        ])
    }
    
    private func configVerticalPasswordStackView() {
        verticalPasswordStackView.addArrangedSubview(passwordLabel)
        verticalPasswordStackView.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            verticalPasswordStackView.topAnchor.constraint(equalTo: verticalEmailStackView.bottomAnchor, constant: 30),
            verticalPasswordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            verticalPasswordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            passwordLabel.heightAnchor.constraint(equalToConstant: 15),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 45)

        ])
    }
    
    private func configAuthenticateButton() {
        NSLayoutConstraint.activate([
            authenticateButton.topAnchor.constraint(equalTo: verticalPasswordStackView.bottomAnchor, constant: 30),
            authenticateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authenticateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authenticateButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc private func pressedAuthentication() {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            print("Dados informados para autenticar: \(email) \(password)")
            if email.isEmpty || password.isEmpty {
                displayAlert(title: "Falha", message: "Dados vazios!", preferredStyle: .alert)
                return
            }
            validateEmail(email: email.lowercased())
            if(email.lowercased() == validEmail && password == validPassword) {
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

extension ViewController: UITextFieldDelegate {
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

