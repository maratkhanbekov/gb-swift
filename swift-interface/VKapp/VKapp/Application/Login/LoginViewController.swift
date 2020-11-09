//
//  LoginFormController.swift
//  VKapp
//
//  Created by Marat on 29.07.2020.
//  Copyright © 2020 Marat. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var interactiveAnimator: UIViewPropertyAnimator!

    
    // Функция-проверка перед переходом на другой контроллер
    //    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //        // Запрашиваем пользователя и получаем ответ
    //        let result = checkUser()
    //
    //        // Показываем сообщение в случае ошибки
    //        if !result {
    //            showLoginError()
    //        }
    //
    //        return result
    //    }
    
    func checkUser() -> Bool {
        guard let name = loginInput.text, let password = passwordInput.text, loginInput.text != "" else { return false }
        return CurrentUser.sharedInstance.requestUser(by: name, with: password)
    }
    
    
    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonSignIn.layer.cornerRadius = 10
        loginInput.text = "Marat"
        
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
//        animateInputsAppearing()
        animateInputsAppearingGroup()
        animateImageAppearing()
        animatebuttonSignInAppearing()
        animateLabels()
        
        
//        let superViewWidth = view.frame.size.width
//        let superViewHeight = view.frame.size.height
//        let whiteView = UIView()
//
//        whiteView.frame = CGRect(x: 0, y: 0, width: superViewWidth, height: superViewHeight)
//        whiteView.backgroundColor = .white
//
//        view.addSubview(whiteView)
        
        let whiteView = UIView()
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whiteView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            whiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            whiteView.widthAnchor.constraint(equalToConstant: view.frame.width),
            whiteView.heightAnchor.constraint(equalToConstant: view.frame.height),
        ])
        view.bringSubviewToFront(whiteView)
        
        
        
        
        
        
        // Анимация точек
        let spaceBetweenDots: CGFloat = 20.0
        let dot1 = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        dot1.backgroundColor = .blue
        dot1.layer.cornerRadius = 5
        view.addSubview(dot1)
        view.bringSubviewToFront(dot1)
        dot1.translatesAutoresizingMaskIntoConstraints = false
        dot1.center = CGPoint(x: view.frame.midX - spaceBetweenDots, y: view.frame.midY)
        
        let dot2 = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        dot2.backgroundColor = .blue
        dot2.layer.cornerRadius = 5
        view.addSubview(dot2)
        view.bringSubviewToFront(dot2)
        dot2.translatesAutoresizingMaskIntoConstraints = false
        dot2.center = CGPoint(x: view.frame.midX, y: view.frame.midY)
        
        let dot3 = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        dot3.backgroundColor = .blue
        dot3.layer.cornerRadius = 5
        view.addSubview(dot3)
        view.bringSubviewToFront(dot3)
        dot3.translatesAutoresizingMaskIntoConstraints = false
        dot3.center = CGPoint(x: view.frame.midX + spaceBetweenDots, y: view.frame.midY)
        
        
        UIView.animate(withDuration: 0.8, delay: 0, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            dot1.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.2, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            dot2.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.4, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            dot3.alpha = 0
        }, completion: nil)
        

        UIView.animate(withDuration: 1, delay: 3, options: [.curveEaseOut], animations: {
            dot1.alpha = 0
            dot2.alpha = 0
            dot3.alpha = 0
            whiteView.alpha = 0
        }, completion: {_ in
            whiteView.removeFromSuperview()
            dot1.removeFromSuperview()
            dot2.removeFromSuperview()
            dot3.removeFromSuperview()
        })
        
        
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
          self.buttonSignIn.addGestureRecognizer(recognizer)
        
        
    }
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            interactiveAnimator?.startAnimation()
            
            interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
                                                         dampingRatio: 0.5,
                                                         animations: {
                self.buttonSignIn.transform = CGAffineTransform(translationX: 0,
                                                              y: 150)
            })
            
            interactiveAnimator.pauseAnimation()
        case .changed:
            let translation = recognizer.translation(in: self.view)
            interactiveAnimator.fractionComplete = translation.y / 100
        case .ended:
            interactiveAnimator.stopAnimation(true)
            
            interactiveAnimator.addAnimations {
                self.buttonSignIn.transform = .identity
            }
            
            interactiveAnimator.startAnimation()
        default: return
        }
    }

    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        
        UIView.animate(withDuration: 1) {
            
            self.logoTopConstraint.constant = 20
            self.view.layoutIfNeeded()
        }
    }
    
    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        
        UIView.animate(withDuration: 1) {
            
            self.logoTopConstraint.constant = 80
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        // Альтернативный способ перехода без segue
        if checkUser() {
            let TabBarVC = storyboard?.instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
            
            self.show(TabBarVC, sender: nil)
            
        }
        else {
            showLoginError()
        }
        
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    
    // Ф-я анимации полей
    func animateInputsAppearing() {
        let offset = view.bounds.width
        loginInput.transform = CGAffineTransform(translationX: -offset, y: 0)
        passwordInput.transform = CGAffineTransform(translationX: offset, y: 0)
        
        UIView.animate(withDuration: 1,
                       delay: 3,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        self.loginInput.transform = .identity
                        self.passwordInput.transform = .identity
        },
                       completion: nil)
        
    }
    
    func animateInputsAppearingGroup() {
        
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1

        let scaleAnimation = CASpringAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        scaleAnimation.stiffness = 150
        scaleAnimation.mass = 2

        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 1
        animationsGroup.beginTime = CACurrentMediaTime() + 3
        animationsGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        animationsGroup.animations = [fadeInAnimation, scaleAnimation]

        self.loginInput.layer.add(animationsGroup, forKey: nil)
        self.passwordInput.layer.add(animationsGroup, forKey: nil)

    }
    
    // Функция появления логотипа
    func animateImageAppearing() {
        let offset = view.bounds.height
        
        logoImage.transform = CGAffineTransform(translationX: 0, y: -offset)
        
        UIView.animate(withDuration: 2,
                       delay: 3,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.3,
                       options: .curveEaseInOut,
                       animations: {
            self.logoImage.transform = .identity
        }, completion: nil)
        
        
    }
    
    func animatebuttonSignInAppearing() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 3
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.buttonSignIn.layer.add(animation, forKey: nil)
    }
    
    func animateLabels() {
        
        // calculationModeCubic чтобы получить равномерную анимацию с плавными поворотами.

        UIView.animateKeyframes(withDuration: 1, delay: 3, options: [.calculationModeCubic], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.loginLabel.transform = CGAffineTransform(translationX: 150, y: -50)
                
                self.passwordLabel.transform = CGAffineTransform(translationX: -150, y: 50)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.loginLabel.transform = .identity
                
                self.passwordLabel.transform = .identity
            })
            
        }, completion: nil)
    }
    
    
    
    @IBAction func unwindToLogin(_ sender: UIStoryboardSegue) {}
}
