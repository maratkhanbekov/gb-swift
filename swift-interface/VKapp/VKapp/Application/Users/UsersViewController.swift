//
//  UsersViewController.swift
//  VKapp
//
//  Created by Marat on 16.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDataSource {
    var data = CurrentUser.sharedInstance
    let user_id = CurrentUser.sharedInstance.user!.id
    var nonFriends = [User]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let users = data.getAllUsers()
        
        for user in users {
            if data.getUserFriends(by: user_id).contains(user) {
                continue
            }
            else {
                nonFriends.append(user)
            }
        }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = nonFriends[indexPath.row]
        
        data.addFriend(friend_id: selectedUser.id, user_id: user_id)
//        DispatchQueue.global(qos: .userInitiated).async {
//            DispatchQueue.main.async {
                self.tableView.reloadData()
//            }
//        }
        
    }
}



extension UsersViewController: UITableViewDelegate {}
