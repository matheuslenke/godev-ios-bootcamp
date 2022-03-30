//
//  ViewController.swift
//  GoDevDemo
//
//  Created by Matheus Lenke on 29/03/22.
//

import UIKit
import GoDev

class ViewController: UIViewController {

    lazy var button: GoDevButton = {
        let config = GoDevButton.Config.dark()
        let button = GoDevButton(config: config)
        button.setTitle("Favorite", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var content: GoDevView = {
        let view = GoDevView(bg: .red)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Componentização"
        view.backgroundColor = .systemBackground
        
        view.addSubview(content)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            content.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

