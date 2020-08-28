
import UIKit

class GroupsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var data = CurrentUser.sharedInstance
    let user_id = CurrentUser.sharedInstance.user!.id
    
//    var groupList = GroupList()
//    var myGroups: [Group] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
    }
}

extension GroupsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.getUserGroups(user_id: user_id).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group = data.getUserGroups(user_id: user_id)[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        
        cell.configure(for: group)
        return cell
    }
    
}

extension GroupsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedGroup = data.getUserPosts(by: user_id)[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(identifier: "GroupCollectionViewController") as! GroupCollectionViewController
        
        vc.selectedGroup = selectedGroup
        self.show(vc, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            
            
            data.removeGroup(group_id: data.getUserGroups(user_id: user_id)[indexPath.row].id, user_id: user_id)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }
    }

}
