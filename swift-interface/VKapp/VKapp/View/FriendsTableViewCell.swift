//
//  FriendsTableViewCell.swift
//  VKapp
//
//  Created by Marat on 06.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

//        backgroundColor = .lightGray
//        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(for model: Friend) {
        nameLabel.text = model.name
        ageLabel.text = "\(model.age)"
        avatarImageView.image = UIImage.init(named: model.imageName)
    }

}
