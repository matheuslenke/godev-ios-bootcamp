//
//  CustomTableViewCell.swift
//  ViewCode
//
//  Created by Douglas Nunes on 22/03/22.
//
/*
 btBuyProduct.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
 */
import UIKit

class CustomTableViewCell: UITableViewCell {

	static let identifier = "CustomTableViewCell"
	
	lazy var iconImageView: UIImageView = {
		let icon = UIImageView()
		icon.image = UIImage(systemName: "house")
		icon.contentMode = .scaleAspectFit
		icon.tintColor = .purple
		icon.translatesAutoresizingMaskIntoConstraints = false
		return icon
	}()
	
	lazy var contentStack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		stack.alignment = .top
		stack.spacing = 10
		stack.translatesAutoresizingMaskIntoConstraints = false
		return stack
	}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 14)
		label.text = "Douglas Henrique Goulart Nunes"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.textColor = .lightGray
		label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only"
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 12)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		addSubview(iconImageView)
		
		NSLayoutConstraint.activate([
			iconImageView.widthAnchor.constraint(equalToConstant: 30),
			iconImageView.heightAnchor.constraint(equalToConstant: 30),
			iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
		
		addSubview(contentStack)
		
		NSLayoutConstraint.activate([
			contentStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			contentStack.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
			contentStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
			contentStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
		])
		
		
		contentStack.addArrangedSubview(titleLabel)
		contentStack.addArrangedSubview(descriptionLabel)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}



}
