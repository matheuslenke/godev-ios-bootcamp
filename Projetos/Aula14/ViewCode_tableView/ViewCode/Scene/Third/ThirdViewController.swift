//
//  ThirdViewController.swift
//  ViewCode
//
//  Created by Douglas Nunes on 25/03/22.
//

import UIKit

class ThirdViewController: UIViewController {

	lazy var closeButton: UIButton = {
		let button = UIButton(type: .close)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.tintColor = .red
		button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
		return button
	}()
    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Third View Controller"
		view.backgroundColor = .green
		
		view.addSubview(closeButton)
		
		NSLayoutConstraint.activate([
			closeButton.heightAnchor.constraint(equalToConstant: 30),
			closeButton.widthAnchor.constraint(equalToConstant: 30),
			closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
			closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
		])
    }
	
	@objc func closeModal() {
		dismiss(animated: true)
	}

}
