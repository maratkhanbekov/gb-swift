//
//  GroupTableViewCell.swift
//  VKapp
//
//  Created by Marat on 06.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {


    @IBOutlet weak var groupImageView: UIImageView!
    
    @IBOutlet weak var groupNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(for model: Group) {
        groupNameLabel.text = model.name
        groupImageView.image = UIImage.init(named: model.avatar)
    }

}
