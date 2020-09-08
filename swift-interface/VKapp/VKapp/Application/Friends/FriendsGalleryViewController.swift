//
//  FriendsGalleryViewController.swift
//  VKapp
//
//  Created by Marat on 06.09.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class FriendsGalleryViewController: UIViewController {
    var data = CurrentUser.sharedInstance
    var selectedFriend: User?
    var interactiveAnimator: UIViewPropertyAnimator!
    var stackView = UIStackView()
    
    var stackViewWidth = CGFloat()
    var imageWidth: CGFloat = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedFriend = data.getUser(by: 1)
        let pictures = data.getUserPosts(by: 1)
        
        
        //Stack View
        //        stackView = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for pic in pictures {
            let imageView = UIImageView()
            imageView.heightAnchor.constraint(equalToConstant: imageWidth).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
            imageView.image = UIImage(named: pic.image)
            stackView.addArrangedSubview(imageView)
            stackViewWidth += imageWidth
        }
        
        
        
        view.addSubview(stackView)
        
//        stackViewWidth = stackView.frame.width
        
//        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: imageWidth/2 - 200).isActive = true
//        stackView.heightAnchor.constraint(equalToConstant: imageWidth).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
//
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        stackView.layoutIfNeeded()
//        stackView.center = CGPoint(x: view.frame.midX , y: view.frame.midY)

        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(trackStackView))
        
        
        stackView.addGestureRecognizer(panRecognizer)
    }
    
    @objc func trackStackView(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            print("BEGAN")
            interactiveAnimator?.startAnimation()
            
            interactiveAnimator = UIViewPropertyAnimator(duration: 10,
                                                         dampingRatio: 0,
                                                         animations: {
//                                                            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -600).isActive = true
                                                            
            })
            stackView.layoutIfNeeded()
            interactiveAnimator?.pauseAnimation()
        case .changed:
            print("CHANGED")
            
            let translation = sender.translation(in: self.view)
            
            print(translation.x)
//            let translation = sender.translation(in: self.view)
//            interactiveAnimator.fractionComplete = translation.x / 100
            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: translation.x).isActive = true
            stackView.layoutIfNeeded()
        case .ended:
            print("ENDED")
            
            interactiveAnimator.stopAnimation(true)
            
            interactiveAnimator.addAnimations {
                self.stackView.transform = .identity
            }
            stackView.layoutIfNeeded()
            interactiveAnimator.startAnimation()
        default:
            break
        }
    }
}
