//
//  ViewController.swift
//  Viewcode
//
//  Created by Matheus Lenke on 22/03/22.
//

import UIKit

class ViewController: UIViewController {
    
//    lazy var button: UIButton = {
//        let btn = UIButton()
//        return btn
//    }()
    
    var safeArea: UILayoutGuide!
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "airplane")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.numberOfLines = 0
        label.text = "lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsum"
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        
//        button.setTitle("Titulo do botão", for: .normal)
//        button.frame = CGRect(x: view.frame.width/2, y: view.frame.height/2, width: 130, height: 45)
//        button.backgroundColor = .systemIndigo

//        view.addSubview(button)
        
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        

        iconLayout()
        titleLabelLayout()

        view.backgroundColor = .orange
        title = "View controller"
    }
    
    private func iconLayout() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            iconImageView.heightAnchor.constraint(equalToConstant: 80),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    private func titleLabelLayout() {
        titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-16).isActive = true
    }


}

