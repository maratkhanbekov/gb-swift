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
    
    func configure(for model: User) {
        nameLabel.text = model.name
        ageLabel.text = "\(model.age)"
        avatarImageView.image = UIImage.init(named: model.avatar)
    }
    @IBAction func buttonAvatarImage(_ sender: Any) {
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.8
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 5
        animation.duration = 5
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.avatarImageView.layer.add(animation, forKey: nil)
        
    }
    
}
