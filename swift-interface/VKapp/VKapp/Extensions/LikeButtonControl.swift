import UIKit

struct Colors {
    static let twitterBlue = UIColor(red: 29.0/255.0, green: 161.0/255.0, blue: 242.0/255.0, alpha: 1.0)
}

class LikeButton: UIButton {
    
    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = Colors.twitterBlue.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitle("", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        addTarget(self, action: #selector(LikeButton.buttonPressed), for: .touchUpInside)
        backgroundColor = Colors.twitterBlue
        setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    @objc func buttonPressed() {
        animateLikeButton()
    }
    
    func activateButton() {
        
        
        
        isOn = isOn == true ? false : true
        
        let color = isOn == true ? Colors.twitterBlue : .clear
//        let titleColor = bool ? .white : Colors.twitterBlue
        let icon = isOn == true ? "heart.fill" : "heart"
        let likes = isOn == true ? "1" : ""
        setTitle(likes, for: .normal)
        
//        setTitleColor(titleColor, for: .normal)
        setImage(UIImage(systemName: icon), for: .normal)
         
    }
    
    func animateLikeButton() {
        UIView.animate(withDuration: 0.2,
                               delay: 0,
                               usingSpringWithDamping: 0.8,
                               initialSpringVelocity: 0.3,
                               options: [.curveEaseInOut, .autoreverse],
                               animations: {
                                self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                },
                               completion: { _ in
                                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                                self.activateButton()
         }
        )
    }
}
