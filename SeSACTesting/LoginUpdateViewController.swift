//
//  LoginUpdateViewController.swift
//  SeSACTesting
//
//  Created by 이은서 on 12/11/23.
//

import UIKit

struct User {
    var email: String
    var password: String
    var check: String
}


struct Validator {
    func isValidEmail(email: String) -> Bool {
        return email.contains("@") && email.count >= 6
    }
    
    func isValidPassword(password: String) -> Bool {
        return password.count >= 6 && password.count < 10
    }
    
    func isEqualPassword(password: String, check: String) -> Bool {
        return password == check
    }
}


class LoginUpdateViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    
    let validator = Validator()
    var user = User(email: "", password: "", check: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func clicked(_ sender: UIButton) {
        user = User(email: emailTextField.text!, password: passwordTextField.text!, check: checkTextField.text!)
        
        if validator.isValidEmail(email: user.email) &&
            validator.isValidPassword(password: user.password) &&
            validator.isEqualPassword(password: user.password, check: user.check) {
            print("성공")
        } else {
            print("실패")
        }
    }
}
