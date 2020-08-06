import UIKit

private let reuseIdentifier = "FriendsCollectionViewCell"

class FriendsCollectionViewController: UICollectionViewController {

    var selectedFriend: Friend?
    var imgCollection: [String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgCollection = selectedFriend?.imgCollection
    }

  

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgCollection?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendsCollectionViewCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .yellow
        
        
//        cell.myPicture.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        cell.myPicture.image = UIImage(named: imgCollection![indexPath.row])

    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        return CGSize(width: 300, height: 300)
    }


}
