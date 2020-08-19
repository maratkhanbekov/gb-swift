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

// Задаем название для дальнейшего использования
let userModelDidUpdateNotification = "userModelDidUpdateNotification"

// Создаем класс singleton с данными, которые будут доступны остальным подписчикам
class CurrentUser {
    let data = VKData()
    static var sharedInstance = CurrentUser()
    private init() {}
    
    // Создаем переменную с данными, которая доступна только на чтение
    private (set) var user: User? {
        
        // При изменении переменной отправляем уведомление
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: userModelDidUpdateNotification), object: nil)
        }
    }
    // Функция для запроса и записи данных в singleton
    func requestUser(by user_name: String, with password: String) -> Bool {
        do {
            // Пробуем записать
            self.user = try data.signIn(by: user_name, with: password)
            return true
        }
        catch userErrors.userNotFound {
            print(userErrors.userNotFound.errorDescription!)
            return false
        }
        catch {
            print("Ошибка")
            return false
        }
    }
}
