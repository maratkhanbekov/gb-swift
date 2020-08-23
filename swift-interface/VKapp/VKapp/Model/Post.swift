import Foundation

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
    
    var images: [String]
}
