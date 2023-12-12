//
//  LoginViewController.swift
//  SeSACTesting
//
//  Created by 이은서 on 12/11/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DI(의존성 주입), 외부에서 인스턴스 생성해서 클래스 인스턴스를 생성할 때 의존성 주입이 이루어짐
//        let food = 코종반점()
//        let hue = 휴님(중국집: food)
        
        let koko = 코코종()
        let food = 코종반점(주인: koko)
        let hue = 휴님(중국집: food)
        
    }
    
    @IBAction func clicked(_ sender: UIButton) {
        
        if isValidEmail() && isValidPassword() && isEqualPassword() {
            print("성공")
        } else {
            print("실패")
        }
        
        
    }
    
    
    func isValidEmail() -> Bool {
        guard let check = emailTextField.text else {
            return false
        }
        return check.contains("@") && check.count >= 6
    }
    
    func isValidPassword() -> Bool {
        guard let check = passwordTextField.text else {
            return false
        }
        return check.count >= 6 && check.count < 10
    }
    
    func isEqualPassword() -> Bool {
        guard let password = passwordTextField.text, let check = checkTextField.text else {
            return false
        }
        return password == check
    }
    
}
