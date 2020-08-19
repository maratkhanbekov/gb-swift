//
//  UsersViewController.swift
//  VKapp
//
//  Created by Marat on 16.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDataSource {
    var data: VKData?
    let currentUser = CurrentUser.sharedInstance.user!
    var nonFriends = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let users = data!.getAllUsers()
        
        for user in users {
            if currentUser.friends.contains(user.id) {
                continue
            }
            else {
                nonFriends.append(user)
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nonFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UsersTableViewCell
        
        let user = nonFriends[indexPath.row]
        
        cell.configure(for: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedUser = nonFriends[indexPath.row]
    
        data!.addFriend(friend_id: selectedUser.id, user_id: currentUser.id)
        tableView.reloadData()
        
    }
}



extension UsersViewController: UITableViewDelegate {}
