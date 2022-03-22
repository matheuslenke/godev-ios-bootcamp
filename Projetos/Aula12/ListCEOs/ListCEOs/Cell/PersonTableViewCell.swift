//
//  PersonTableViewCell.swift
//  ListCEOs
//
//  Created by Matheus Lenke on 21/03/22.
//

import UIKit
import Kingfisher

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
    
    func setup(person: Person) {
        nameLabel.text = person.name
        companyLabel.text = person.company.name
        let url = URL(string: person.photoUrl)
        profileImageView.kf.setImage(with: url)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
