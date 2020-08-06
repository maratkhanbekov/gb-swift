//
//  Friend.swift
//  VKapp
//
//  Created by Marat on 06.08.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import Foundation

struct Friend {
    let name: String
    let age: Int
    let imageName: String
    let imgCollection: [String]
}


struct FriendList {
    let friends = [
        Friend(name: "Anton", age: 34, imageName: "friend1",
               imgCollection: ["piс1", "pic2", "pic3", "pic4"]),
        Friend(name: "Eugene", age: 35, imageName: "friend2", imgCollection: ["piс1", "pic2", "pic3", "pic4"]),
        Friend(name: "Kate", age: 18, imageName: "friend3", imgCollection: ["piс1", "pic2", "pic3", "pic4"]),
        Friend(name: "Anton", age: 34, imageName: "friend4", imgCollection: ["piс1", "pic2", "pic3", "pic4"]),
        Friend(name: "Eugene", age: 35, imageName: "friend5", imgCollection: ["piс1", "pic2", "pic3", "pic4"]),
        Friend(name: "Kate", age: 18, imageName: "friend6", imgCollection: ["piс1", "pic2", "pic3", "pic4"]),
        Friend(name: "Anton", age: 34, imageName: "friend7", imgCollection: ["piс1", "pic2", "pic3", "pic4"]),
        
    ]
    
    func getFriend(by number: Int) -> Friend {
        return friends[number]
    }
    
    func numberOfFriends() -> Int {
        return friends.count
    }
}
