//
//  FriendsCollectionViewCell.swift
//  VKapp
//
//  Created by Marat on 06.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var counterLabel: LikeButton!
    
    
    var postId: Int?
    
    @IBOutlet weak var myPicture: UIImageView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    func setupView() {
    
//        let likeButton = LikeButton()
//        likeButton.translatesAutoresizingMaskIntoConstraints = false
//        likeButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        likeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
//    let likeButton = LikeButton()
//    self.view.addSubview(likeButton)
    
}
