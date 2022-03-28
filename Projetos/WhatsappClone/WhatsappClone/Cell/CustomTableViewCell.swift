//
//  CustomTableViewCell.swift
//  WhatsappClone
//
//  Created by Matheus Lenke on 25/03/22.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    // MARK: Properties
    var personName: String? {
        didSet {
            nameLabel.text = personName
        }
    }
    var messageText: String? {
        didSet {
            messageLabel.text = messageText
        }
    }
    var messageDate: String? {
        didSet {
            dateLabel.text = messageDate
        }
    }
    
    // MARK: Visual elements
    
    lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "naruto")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = personName
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = messageDate
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = messageText
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var enterMessageArrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .lightGray
        return image
    }()
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
    }
    
    func setup(_ message: Message) {
        let url = URL(string: message.avatarUrl)
        avatarImageView.kf.setImage(with: url)
        self.personName = message.contactName
        self.messageText = message.message
        self.messageDate = message.sentDate
    }
    
    private func configUI() {
        
        accessoryType = .disclosureIndicator
        addSubview(avatarImageView)
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(nameLabel)
        horizontalStackView.addArrangedSubview(dateLabel)
        
        verticalStackView.addArrangedSubview(messageLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            verticalStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            
            horizontalStackView.heightAnchor.constraint(equalToConstant: 30),

        ])
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
        avatarImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
