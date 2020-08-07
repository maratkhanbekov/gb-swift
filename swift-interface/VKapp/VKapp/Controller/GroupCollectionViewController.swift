
import UIKit

private let reuseIdentifier = "GroupCollectionViewCell"

class GroupCollectionViewController: UICollectionViewController {
    
    var selectedGroup: Group?
    var imgCollection: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        imgCollection = selectedGroup?.imgCollection
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imgCollection?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GroupCollectionViewCell
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .lightGray : .yellow
        
        cell.groupPicture.image = UIImage(named: imgCollection![indexPath.row])

    
        return cell
    }

//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//           return CGSize(width: 500, height: 500)
//       }

}
