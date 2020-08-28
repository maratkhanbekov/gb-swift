import Foundation

struct User: Equatable {
    var id: Int
    var name: String
    var password: String
    var age: Int
    var avatar: String
    var posts: [Int]
    var friends: [Int]
    var groups: [Int]
    
    public static func ==(lhs: User, rhs: User) -> Bool {
        return
            lhs.id == rhs.id
    }
}
