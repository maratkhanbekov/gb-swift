//
//  UsersTableViewCell.swift
//  VKapp
//
//  Created by Marat on 16.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var buttonLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
    }
    
    func configure(for model: User) {
        nameLabel.text = model.name
        ageLabel.text = String(model.age)
        userAvatar.image = UIImage.init(named: model.avatar)
        
//        if model.friends
//        buttonLabel.currentTitle = ""
    }
    

}
