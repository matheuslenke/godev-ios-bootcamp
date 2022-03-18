//
//  CustomTableViewCell.swift
//  TableView_Custom
//
//  Created by Douglas Nunes on 13/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
	
	
	@IBOutlet weak var logoImageView: UIImageView!
	@IBOutlet weak var nameTimeLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!

	
	func setup(logo: String, name: String, description: String) {
		logoImageView.image = UIImage(named: logo)
		nameTimeLabel.text = name
		descriptionLabel.text = description
	}
}
