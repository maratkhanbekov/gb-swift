import UIKit

private let reuseIdentifier = "FriendsCollectionViewCell"

class FriendsCollectionViewController: UICollectionViewController {
    
    var data = CurrentUser.sharedInstance
    var selectedFriend: User?
//    let user_id = CurrentUser.sharedInstance.user!.id
    let user_id = 1

//    private let itemsPerRow: CGFloat = 3
//    private let sectionInsets = UIEdgeInsets(top: 50.0,
//    left: 20.0,
//    bottom: 50.0,
//    right: 20.0)
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedFriend = data.getUser(by: 1)
        
    }

  

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.getUserPosts(by: selectedFriend!.id).count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendsCollectionViewCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .yellow
        
        cell.myPicture.image = UIImage(named: data.getUserPosts(by: selectedFriend!.id)[indexPath.row].image)
        
        cell.postId = data.getUserPosts(by: selectedFriend!.id)[indexPath.row].id

    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedPost = data.getUserPosts(by: selectedFriend!.id)[indexPath.row]
        print(selectedPost.desc)
        
        data.clickLike(post_id: data.getUserPosts(by: selectedFriend!.id)[indexPath.row].id, user_id: user_id)
        
        print(data.getUserPosts(by: selectedFriend!.id)[indexPath.row].liked_by_users)
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//          let availableWidth = view.frame.width - paddingSpace
//          let widthPerItem = availableWidth / itemsPerRow
//
//       return CGSize(width: widthPerItem, height: widthPerItem)
//    }


}
