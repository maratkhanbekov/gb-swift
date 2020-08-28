import Foundation

struct User {
    var id: Int
    var name: String
    var age: Int
    var avatar: String
    var posts: [Int]
    var friends: [Int]
    var groups: [Int]
}

struct Group {
    var id: Int
    var name: String
    var avatar: String
    var images: [String]
}

struct Post {
    var id: Int
    var image: String
    var desc: String
    var liked_by_users: [Int]
    func numberOfLikes() -> Int {
        return liked_by_users.count
    }
    func isLikeByUser(user_id: Int) -> Bool {
        return liked_by_users.contains(user_id)
    }
}

struct VKData {
    var posts = [
        Post(id: 1, image: "pic1", desc: "Описание1", liked_by_users: [1, 2]),
        Post(id: 2, image: "pic2", desc: "Описание2", liked_by_users: [1, 2]),
        Post(id: 3, image: "pic3", desc: "Описание3", liked_by_users: [1, 2]),
        Post(id: 4, image: "pic4", desc: "Описание4", liked_by_users: [1, 2]),
    ]
    
    var users = [
        User(id: 1, name: "Anton", age: 34, avatar: "user1", posts: [1], friends: [2, 3], groups: [1, 2, 3]),
        User(id: 2, name: "Eugene", age: 35, avatar: "user2", posts: [2], friends: [3, 4], groups: [1, 2, 3]),
        User(id: 3, name: "Kate", age: 18, avatar: "user3", posts: [3], friends: [4, 5], groups: [1, 2, 3]),
        User(id: 4, name: "Anton", age: 34, avatar: "user4", posts: [4], friends: [5, 6], groups: [1, 2, 3]),
        User(id: 5, name: "Eugene", age: 35, avatar: "user5", posts: [1], friends: [6], groups: [1, 2, 3]),
        User(id: 6, name: "Kate", age: 18, avatar: "user6", posts: [2], friends: [7], groups: [1, 2]),
        User(id: 7, name: "Anton", age: 34, avatar: "user7", posts: [3], friends: [2, 3], groups: [1, 2, 3]),
    ]
    
    var groups = [
        Group(id: 1, name: "1Автомобили", avatar: "car", images: ["car"]),
        Group(id: 2, name: "1Музыка", avatar: "music", images: ["music"]),
        Group(id: 3, name: "1Природа", avatar: "nature", images: ["nature"])
    ]
    
    func getUser(for id: Int) -> User {
        if let user = users.first(where: {$0.id == id}) {
            return user
        }
        else {
            return users[0]
        }
    }
    
    func getUserFriends(for id: Int) -> [User] {
        var friends: [User] = []
        if let user = users.first(where: {$0.id == id}) {
            for id in user.friends {
                friends.append(getUser(for: id))
            }
            return friends
        }
        else {
            return [self.users[0]]
        }
    }
    
    func getGroup(for id: Int) -> Group {
        if let group = groups.first(where: {$0.id == id}) {
            return group
        }
        else {
            return groups[0]
        }
    }
    
    func getUserGroups(user_id: Int) -> [Group] {
        var groups: [Group] = []
        if let user = users.first(where: {$0.id == user_id}) {
            for id in user.groups {
                groups.append(getGroup(for: id))
            }
            return groups
        }
        else {
            return [self.groups[0]]
        }
    }
    
    func getPost(_ id: Int) -> Post {
        if let post = posts.first(where: {$0.id == id}) {
            return post
        }
        else {
            return posts[0]
        }
    }
    
    mutating func getUserPosts(for user_id: Int) -> [Post] {
        var posts: [Post] = []
        
        if let user = users.first(where: {$0.id == user_id}) {
            for id in user.posts {
                posts.append(getPost(id))
            }
            return posts
        }
            
        else {
            return [self.posts[0]]
        }
    }
    
    mutating func addFriend(friend_id: Int, user_id: Int) {
        let user_index = users.firstIndex(where: {$0.id == user_id})
        users[user_index!].friends.append(friend_id)
    }
    
    mutating func removeFriend(friend_id: Int, user_id: Int) {
        let friend_index = getUser(for: user_id).friends.firstIndex(where: {$0 == friend_id})
        let user_index = users.firstIndex(where: {$0.id == user_id})
        users[user_index!].friends.remove(at: friend_index!)
    }
    
    mutating func addGroup(group_id: Int, user_id: Int) {
        let user_index = users.firstIndex(where: {$0.id == user_id})
        users[user_index!].groups.append(group_id)
    }
    
    mutating func removeGroup(group_id: Int, user_id: Int) {
        let group_index = getUser(for: user_id).groups.firstIndex(where: {$0 == group_id})
        let user_index = users.firstIndex(where: {$0.id == user_id})
        users[user_index!].groups.remove(at: group_index!)
    }
    
    mutating func clickLike(post_id: Int, user_id: Int) {
        let post_index = posts.firstIndex(where: {$0.id == post_id})
        let post = posts.first(where: {$0.id == post_id})
        
        if post!.liked_by_users.contains(user_id) {
            let user_index = post!.liked_by_users.firstIndex(where: {$0 == user_id})
            posts[post_index!].liked_by_users.remove(at: user_index!)
        }
        else {
            posts[post_index!].liked_by_users.append(user_id)
        }
    }
}


var vkdata = VKData()

//vkdata.getUserFriends(for: 7).count
//vkdata.addFriend(friend_id: 4, user_id: 7)
//vkdata.getUserFriends(for: 7).count
//vkdata.removeFriend(friend_id: 4, user_id: 7)
//vkdata.getUserFriends(for: 7).count

vkdata.getUserGroups(user_id: 6).count
vkdata.addGroup(group_id: 3, user_id: 6)
vkdata.getUserGroups(user_id: 6).count
vkdata.removeGroup(group_id: 3, user_id: 6)
vkdata.getUserGroups(user_id: 6).count
//vkdata.getUserGroups(for: 7)

vkdata.getPost(1).numberOfLikes()
vkdata.clickLike(post_id: 1, user_id: 5)
vkdata.getPost(1).numberOfLikes()
vkdata.clickLike(post_id: 1, user_id: 5)
vkdata.getPost(1).numberOfLikes()

