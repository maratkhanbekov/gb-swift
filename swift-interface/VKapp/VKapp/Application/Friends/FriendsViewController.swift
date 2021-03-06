
import UIKit

class FriendsViewController: UIViewController {
    
    // Сразу задаем исходный id
    var user_id = CurrentUser.sharedInstance.user!.id
    var data = CurrentUser.sharedInstance
    
    var userFriendsDictionary = [String: [User]]()
    var userFriendsTitles = [String]()
    var userFriends = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    
    // (иногда более оптимальная альтернатива использовать для подписок viewWillAppear)
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
//        updateSections()
        
        
        
        
        // Подписываемся на поток из NotificationCenter
        NotificationCenter.default.addObserver(self, selector: #selector(getUserUpdate), name: NSNotification.Name(rawValue: userModelDidUpdateNotification), object: nil)
        tableView.reloadData()
    }
    
    func updateSections() {
        
    userFriendsDictionary = [String: [User]]()
    userFriendsTitles = [String]()
    userFriends = [User]()
        
    // Словарь с именами друзей
    for friend in data.getUserFriends(by: user_id) {
        userFriends.append(friend)
    }
    
    // Заполняем словарь с индексами
    for friend in userFriends {
        let friendKey = String(friend.name.prefix(1))
        if var friendValues = userFriendsDictionary[friendKey] {
            friendValues.append(friend)
            userFriendsDictionary[friendKey] = friendValues
        } else {
            userFriendsDictionary[friendKey] = [friend]
        }
     }
    
    userFriendsTitles = [String](userFriendsDictionary.keys)
    userFriendsTitles = userFriendsTitles.sorted(by: {$0 < $1})
    
    tableView.tableFooterView = UIView()
    tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateSections()
           tableView.reloadData()
       }
       
    
    @IBAction func buttonUsersPressed(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(identifier: "UsersViewController") as! UsersViewController
        self.show(vc, sender: nil)
        
    }
    
    
    // Функция, которая срабатывает когда в NotificationCenter происходит изменение у потока с именем userModelDidUpdateNotification
    @objc private func getUserUpdate() {
        if let user = CurrentUser.sharedInstance.user {
            user_id = user.id
        }
    }
    
    // Отписываемся когда класс удаляется (иногда более оптимальная альтернатива использовать viewWillDisappear)
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: userModelDidUpdateNotification), object: self)
    }
    
    @IBAction func buttonAddFriendPressed(_ sender: UIButton) {
        
        let UsersScreen = storyboard?.instantiateViewController(identifier: "UsersViewController") as! UsersViewController
        self.show(UsersScreen, sender: nil)
        
    }
    
    
}

extension FriendsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return userFriendsTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return userFriendsTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.getUserFriends(by: user_id).count
        
        let friendKey = userFriendsTitles[section]
        if let friendValue = userFriendsDictionary[friendKey] {
            return friendValue.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableViewCell
        
        
        let friendKey = userFriendsTitles[indexPath.section]
        if let friend = userFriendsDictionary[friendKey] {
            cell.configure(for: friend[indexPath.row])
        }
        
        

//        let friend = data.getUserFriends(by: user_id)[indexPath.row]
//        cell.configure(for: friend)
        
        return cell
    }
    
    
    
    
}

extension FriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        
        let selectedFriend = data.getUserFriends(by: user_id)[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(identifier: "FriendsGalleryViewController") as! FriendsGalleryViewController
//        vc.selectedFriend = selectedFriend
        self.show(vc, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            
            
            data.removeFriend(friend_id: data.getUserFriends(by: user_id)[indexPath.row].id, user_id: user_id)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }
    }
    
    @IBAction func unwindToFriends(_ sender: UIStoryboardSegue) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.updateSections()
                self.tableView.reloadData()
            }
        }
    }
}
