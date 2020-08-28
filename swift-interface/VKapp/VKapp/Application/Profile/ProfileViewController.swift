//
//  ProfileViewController.swift
//  VKapp
//
//  Created by Marat on 17.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //    let user_id = 1
    let user_id = CurrentUser.sharedInstance.user!.id
    var data = CurrentUser.sharedInstance
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelProfile: UILabel!
    @IBOutlet weak var viewShadow: DesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageProfile.frame.size.width = 200
        imageProfile.frame.size.height = 200
        imageProfile.image = UIImage(named: data.getUser(by: user_id).avatar)
        imageProfile.layer.cornerRadius = 100
        viewShadow.layer.cornerRadius = 100

        labelProfile.text = data.getUser(by: user_id).name
        
        
    }
//    
//    @IBAction func buttonLogoutPressed(_ sender: UIButton) {
//        let LoginScreen = storyboard?.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
//        
//    }
}


