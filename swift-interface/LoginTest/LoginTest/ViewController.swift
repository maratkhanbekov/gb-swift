//
//  ViewController.swift
//  LoginTest
//
//  Created by Marat on 17.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class LoginVC: UIViewController {
    @IBAction func btnActionLogin(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "status")
        Switcher.updateRootVC()
    }
}

class TabBarVC: UIViewController {
    
    @IBAction func btnActionLogout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "status")
        Switcher.updateRootVC()
    }
    
}


class Switcher {
    static func updateRootVC() {
        let status = UserDefaults.standard.bool(forKey: "status")
        var rootVC: UIViewController?
        
        print(status)
        
        if (status == true) {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarvc") as! TabBarVC
        }
        else {
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "logicvc") as! LoginVC
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
        }
    }
}
