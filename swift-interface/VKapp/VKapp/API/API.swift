import Foundation

enum userErrors: Error {
    case userNotFound
    var errorDescription: String? {
        switch self {
        case .userNotFound:
            return "Пользователь не найден"
        }
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
        User(id: 1, name: "Marat", password: "", age: 34, avatar: "user1", posts: [1, 2, 3, 4], friends: [2, 3, 5, 7], groups: [1, 2, 3]),
        User(id: 2, name: "Admin", password: "", age: 35, avatar: "user2", posts: [2], friends: [3, 4], groups: [1, 2, 3]),
        User(id: 3, name: "Andrey", password: "", age: 18, avatar: "user3", posts: [3], friends: [4, 5], groups: [1, 2, 3]),
        User(id: 4, name: "Anton", password: "", age: 34, avatar: "user4", posts: [4], friends: [5, 6], groups: [1, 2, 3]),
        User(id: 5, name: "Eugene", password: "", age: 35, avatar: "user5", posts: [1], friends: [6], groups: [1, 2, 3]),
        User(id: 6, name: "Kate", password: "", age: 18, avatar: "user6", posts: [2], friends: [7], groups: [1, 2]),
        User(id: 7, name: "Denis", password: "", age: 34, avatar: "user7", posts: [3], friends: [2, 3], groups: [1, 2, 3]),
    ]
    
    var groups = [
        Group(id: 1, name: "1Автомобили", avatar: "car", images: ["car"]),
        Group(id: 2, name: "1Музыка", avatar: "music", images: ["music"]),
        Group(id: 3, name: "1Природа", avatar: "nature", images: ["nature"])
    ]
    
   
    
    func getUser(by user_id: Int) -> User {
        if let user = users.first(where: {$0.id == user_id}) {
            return user
        }
        else {
            return users[0]
        }
    }
    
    
    func signIn(by user_name: String, with password: String) throws -> User {
        if let user = users.first(where: {$0.name == user_name && $0.password == password}) {
            return user
        }
        else {
            throw userErrors.userNotFound
        }
    }
    
    func getUserFriends(by user_id: Int) -> [User] {
        var friends: [User] = []
        if let user = users.first(where: {$0.id == user_id}) {
            for id in user.friends {
                friends.append(getUser(by: id))
            }
            return friends
        }
        else {
            return [self.users[0]]
        }
    }
    
    func getAllUsers() -> [User] {
        return users
    }
    
    func getAllPosts() -> [Post] {
        return posts
    }
    
    func getAllGroups() -> [Group] {
        return groups
    }
    
    func getGroup(by group_id: Int) -> Group {
        if let group = groups.first(where: {$0.id == group_id}) {
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
                groups.append(getGroup(by: id))
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
    
    func getUserPosts(by user_id: Int) -> [Post] {
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
        let friend_index = getUser(by: user_id).friends.firstIndex(where: {$0 == friend_id})
        let user_index = users.firstIndex(where: {$0.id == user_id})
        users[user_index!].friends.remove(at: friend_index!)
        print("Friend removed")
    }
    
    mutating func addGroup(group_id: Int, user_id: Int) {
        let user_index = users.firstIndex(where: {$0.id == user_id})
        users[user_index!].groups.append(group_id)
    }
    
    mutating func removeGroup(group_id: Int, user_id: Int) {
        let group_index = getUser(by: user_id).groups.firstIndex(where: {$0 == group_id})
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
