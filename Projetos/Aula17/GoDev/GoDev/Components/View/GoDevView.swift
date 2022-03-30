//
//  GoDevView.swift
//  GoDev
//
//  Created by Matheus Lenke on 29/03/22.
//

import UIKit

public class GoDevView: UIView {
    
    lazy var textInfo: UILabel = {
        let label = UILabel()
        label.text = "Estou centralizado"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public init(bg: UIColor) {
        super.init(frame: .zero)
        backgroundColor = bg
        layer.cornerRadius = 16
        layer.borderWidth = 5.0
        layer.borderColor = UIColor.blue.cgColor
        
        configureTextInfo()
    }
    
    private func configureTextInfo() {
        
        addSubview(textInfo)
        
        NSLayoutConstraint.activate([
            textInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            textInfo.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
