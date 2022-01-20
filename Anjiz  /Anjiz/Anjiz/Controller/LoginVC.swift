//
//  LoginVC.swift
//  Anjiz
//
//  Created by esho on 30/05/1443 AH.
//

import UIKit
import Firebase
class LoginVC: UIViewController {
    
    
    
    @IBOutlet weak var buttonLog: UIButton!
    
    //lable
     let labelLog = UILabel()
     let labelEmail = UILabel()
     let labelPass = UILabel()
     let labelSing = UILabel()
     //field
     let email = UITextField()
     let password = UITextField()
     
     //button
     let buttonSing = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

UI()
        
    }
    

 
    
    
    
    func UI() {
        
        
        // white sub view
        
        //        let subView = UIView()
        //        subView.backgroundColor = .white
        //        subView.frame = CGRect(x: 0, y: 285, width: 390, height: 1500)
        //        subView.layer.cornerRadius = 30
        //        view.addSubview(subView)
        
        //lable sing
        labelLog.frame = CGRect(x: 200, y: 150, width: 200, height: 50)
        labelLog.text = "تسجيل الدخول "
        labelLog.font = UIFont(name: "GillSans-Italic", size: 30)
        labelLog.textColor = .white
        labelLog.textAlignment = .center
        view.addSubview(labelLog)
        
  
        
        
        // label Email
        labelEmail.frame = CGRect(x: 250, y: 350, width: 200, height: 50)
        labelEmail.text = "البريد الالكتروني "
        labelEmail.font = UIFont(name: "GillSans-Italic", size: 19)
        labelEmail.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(labelEmail)
        
        
        //  textField for Email
        email.frame = CGRect(x: 35, y: 400, width: 320, height: 45)
        email.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        email.font = UIFont(name: "GillSans-Italic", size: 15)
        email.placeholder = "ادخل البريد الالكتروني" // display when click on it
        email.textAlignment = .right
        email.layer.cornerRadius = 25
        view.addSubview(email)
        
        // label Pass word
        labelPass.frame = CGRect(x: 270, y: 450, width: 200, height: 50)
        labelPass.text = "كلمه المرور "
        labelPass.font = UIFont(name: "GillSans-Italic", size: 19)
        labelPass.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(labelPass)
        
        
        
        // textField for Password
        password.frame = CGRect(x: 35, y: 500, width: 320, height: 45)
        password.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        password.font = UIFont(name: "GillSans-Italic", size: 15)
        password.isSecureTextEntry = true
        
        password.placeholder = "ادخل كلمه المرور" // display when click on it
        password.textAlignment = .right
        password.layer.cornerRadius = 25
        view.addSubview(password)
        
        
        
        
        
        // button sign Up
        
        buttonLog.frame = CGRect(x: 110, y: 590, width: 170, height: 50)
        buttonLog.layer.cornerRadius = 25
        buttonLog.backgroundColor = .white
        buttonLog.tintColor = .gray
        buttonLog.setTitle(" تسجيل الدخول ", for: .normal)
        

//        view.addSubview(buttonLog)
        
        buttonLog.addTarget(self, action: #selector (LogInBtnClick), for: .touchDown)
        
        
        
        // Sing in
//        buttonSing.frame = CGRect(x: 50, y: 760, width: 230, height: 50)
//        buttonSing.layer.cornerRadius = 25
//        buttonSing.setTitleColor( #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1) , for: .normal)
//        buttonSing.setTitle("تسجيل  ", for: .normal)
//        buttonSing.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 23)
//        view.addSubview(buttonSing)
        
//        buttonSing.addTarget(self, action: #selector (signUpBtnClick), for: .touchDown)
        
        // label log in
        labelLog.frame = CGRect(x: 170, y: 760, width: 200, height: 50)
        labelLog.text = "لا تملك حساب ؟"
        labelLog.font = UIFont(name: "GillSans-Italic", size: 19)
        labelLog.textColor = .gray
        view.addSubview(labelLog)
        
}
    @objc private func LogInBtnClick() {
    Auth.auth().signIn(withEmail: email.text! , password: password.text! ) { authResult, error in
        if error == nil {
            print("تم تسجيل الدخول بنجاح")
            let logVc = TabBarVC()
            logVc.modalPresentationStyle = .fullScreen
            self.present(logVc, animated: true, completion: nil)
          
        } else {
            print(error?.localizedDescription)
            print("لايوجد مستخدم ؟؟")
        }
    }
    }
}
