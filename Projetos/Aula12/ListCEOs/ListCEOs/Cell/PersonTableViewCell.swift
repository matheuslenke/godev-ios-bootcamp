//
//  PersonTableViewCell.swift
//  ListCEOs
//
//  Created by Matheus Lenke on 21/03/22.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    static let identifier = "PersonTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateUI()
    }
    
    func updateUI() {
        
        let radius = self.profileImageView.frame.width / 2
        self.profileImageView.layer.cornerRadius = radius
        self.profileImageView.layer.masksToBounds = true
    }
    
    func setup(name: String, company: String, profileImageURL: String) {
        nameLabel.text = name
        companyLabel.text = company
        profileImageView.downloaded(from: profileImageURL)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
