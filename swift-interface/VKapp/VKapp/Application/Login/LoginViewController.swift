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
        
        animateTitlesAppearing()
        animateImageAppearing()
        animatebuttonSignInAppearing()
        
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
    func animateTitlesAppearing() {
        let offset = view.bounds.width
        loginInput.transform = CGAffineTransform(translationX: -offset, y: 0)
        passwordInput.transform = CGAffineTransform(translationX: offset, y: 0)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut,
                       animations: {
                        self.loginInput.transform = .identity
                        self.passwordInput.transform = .identity
        },
                       completion: nil)
        
    }
    
    func animateImageAppearing() {
        let offset = view.bounds.height
        
        logoImage.transform = CGAffineTransform(translationX: 0, y: -offset)
        
        UIView.animate(withDuration: 2,
                       delay: 0,
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
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.buttonSignIn.layer.add(animation, forKey: nil)
    }
    
    
    
    @IBAction func unwindToLogin(_ sender: UIStoryboardSegue) {}
}
