import UIKit

private let reuseIdentifier = "FriendsCollectionViewCell"

class FriendsCollectionViewController: UICollectionViewController {
    
    var data = VKData()

    var selectedFriend: User?
    var posts: [Post]?
    
//    private let itemsPerRow: CGFloat = 3
//    private let sectionInsets = UIEdgeInsets(top: 50.0,
//    left: 20.0,
//    bottom: 50.0,
//    right: 20.0)
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = data.getUserPosts(by: selectedFriend!.id)
    }

  

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendsCollectionViewCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .yellow
        
        cell.myPicture.image = UIImage(named: posts![indexPath.row].image)

    
        return cell
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
