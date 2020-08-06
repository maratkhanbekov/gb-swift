
import UIKit

class FriendsViewController: UIViewController {
    let friendsList = FriendList()
    @IBOutlet weak var tableView: UITableView!
    
    var myFriends: [Friend] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
    }
    
}

extension FriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.numberOfFriends()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendsTableViewCell
        //        let friend = myFriends[indexPath.row]
        let friend = friendsList.getFriend(by: indexPath.row)
        
        cell.configure(for: friend)
        
        
        return cell
    }
    
   
    
    
    
}

extension FriendsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedFriend = friendsList.getFriend(by: indexPath.row)
        
        let vc = storyboard?.instantiateViewController(identifier: "FriendsCollectionViewController") as! FriendsCollectionViewController
        vc.selectedFriend = selectedFriend
        self.show(vc, sender: nil)

    }
}
