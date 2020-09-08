//
//  FriendsScrollViewController.swift
//  VKapp
//
//  Created by Marat on 07.09.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class FriendsScrollViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    
    var data = CurrentUser.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
//        self.scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        
        let pictures = data.getUserPosts(by: 1)
//        var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)
        var xPosition: CGFloat = 0
        
        let imageWidth: CGFloat = 300
        let imageHeight: CGFloat = 500
        var scrollViewSize: CGFloat = 0
        for index in 0..<4 {
            
            let imageView = UIImageView(image: UIImage(named: pictures[index].image))
            imageView.frame.size.width = imageWidth
            imageView.frame.size.height = imageHeight
            imageView.frame.origin.x = xPosition
            imageView.frame.origin.y = 0
            scrollView.addSubview(imageView)
            
            xPosition += imageWidth
            scrollViewSize += scrollViewSize
//            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
//            frame.size = self.scrollView.frame.size
//
//            let subView = UIView(frame: frame)
////            subView.image = pictures[index].image
//            self.scrollView.addSubview(subView)
        }
        
        scrollView.contentSize = CGSize(width: scrollViewSize, height: imageHeight)
        scrollView.backgroundColor = .green
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.center = CGPoint(x: 0, y: 0)

        
        
        
        
        

        // Do any additional setup after loading the view.
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
