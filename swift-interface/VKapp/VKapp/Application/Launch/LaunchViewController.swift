//
//  LaunchViewController.swift
//  VKapp
//
//  Created by Marat on 04.09.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

//    var dot1: UIView = UIView()
//    var dot2: UIView = UIView()
//    var dot3: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let circle1 = UIView()
//        circle1.backgroundColor = .green
//        self.view.addSubview(circle1)
//
//
//        circle1.translatesAutoresizingMaskIntoConstraints = false
//        circle1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        circle1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        circle1.widthAnchor.constraint(equalToConstant: 10).isActive = true
//        circle1.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        let dot1 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        dot1.backgroundColor = UIColor.gray
        dot1.layer.cornerRadius = 5
        view.addSubview(dot1)
        
        dot1.translatesAutoresizingMaskIntoConstraints = true
        dot1.center = CGPoint(x: view.bounds.midX - 30, y: view.bounds.midY)
        dot1.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]

        let dot2 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        dot2.backgroundColor = UIColor.gray
        dot2.layer.cornerRadius = 5
        view.addSubview(dot2)
        
        dot2.translatesAutoresizingMaskIntoConstraints = true
        dot2.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        dot2.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        
        let dot3 = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        dot3.backgroundColor = UIColor.gray
        dot3.layer.cornerRadius = 5
        view.addSubview(dot3)
        
        dot3.translatesAutoresizingMaskIntoConstraints = true
        dot3.center = CGPoint(x: view.bounds.midX + 30, y: view.bounds.midY)
        dot3.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        
        
        

        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
               dot1.alpha = 0
           }, completion: nil)
           
           UIView.animate(withDuration: 2, delay: 0.2, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
               dot2.alpha = 0
           }, completion: nil)
           
           UIView.animate(withDuration: 2, delay: 0.3, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
               dot3.alpha = 0
           }, completion: nil)
            

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
