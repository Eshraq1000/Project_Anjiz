//
//  SingUp.swift
//  Anjiz
//
//  Created by esho on 17/06/1443 AH.
//

import UIKit
import Firebase
import GoogleSignIn

class SingUp: UIViewController {
 
        
        let db = Firestore.firestore()
    
    @IBOutlet weak var SingBt: UIButton!
    
    @IBOutlet weak var showPasswordButton: UIButton!
    
    

        //lable
        let labelSingUp = UILabel()
        let labelName = UILabel()
        let labelEmail = UILabel()
        let labelPass = UILabel()
        let labelsingGog = UILabel()
        let labelLog = UILabel()
        //field
        let name = UITextField()
        let email = UITextField()
        let password = UITextField()
        
        //button
    let buttonGoogle = UIButton()

//        let buttonSingUp = UIButton()
//        let buttonLogin = UIButton()
        let showPasswordButtonn = UIButton()
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
        
            
            UI()




        }
    
    
    
    @IBAction func SingBTAction(_ sender: Any) {
     
                Auth.auth().createUser(withEmail: email.text!, password: password.text!) { result, error in
                    if error == nil {
                        self.db.collection("Users")
                                .addDocument(data:
                                [
                                   "name":self.name.text! ,
                                   "email":self.email.text! ,
                                   "password":self.password.text!,
                                   "userID" : Auth.auth().currentUser!.uid
                                    
                    
                                ]
                                )
                        
                        print("تم انشاء مستخدم جديد وانشاء البيانات  بنجاح")
                        
                        let vcc = self.storyboard?.instantiateViewController(withIdentifier: "Tabbar")
                        vcc!.modalPresentationStyle = .fullScreen
                        self.present(vcc!, animated: true, completion: nil)
                        
//                        self.performSegue(withIdentifier: "move", sender: self)


                    }else {
                        print(error?.localizedDescription)
                        print("لم يتم انشاء المستخدم")
                       
                    }
                }
            }

        
     
    
        
    
    
  
    
        
        func UI() {
            
            SingBt.layer.cornerRadius = 25
            
            
            // white view
            
    //        let subView = UIView()
    //        subView.backgroundColor = .white
    //        subView.frame = CGRect(x: 0, y: 285, width: 390, height: 1500)
    //        subView.layer.cornerRadius = 30
    //        view.addSubview(subView)

              //lable sing
            labelSingUp.frame = CGRect(x: 200, y: 150, width: 200, height: 50)
            labelSingUp.text = "تسجيل "
            labelSingUp.font = UIFont(name: "GillSans-Italic", size: 30)
            labelSingUp.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
            labelSingUp.textAlignment = .center
            view.addSubview(labelSingUp)
            
            
            
            
            // label Name
            labelName.frame = CGRect(x: 290, y: 250, width: 200, height: 50)
            labelName.text = "الاسم "
            labelName.font = UIFont(name: "GillSans-Italic", size: 19)
            labelName.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
            view.addSubview(labelName)
            
            // textField for Name
            name.frame = CGRect(x: 35, y: 300, width: 320, height: 45)
            name.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
            
    //        ImgeInTextField(textField: textField1, fieldImge: textField1Image!)
            name.font = UIFont(name: "GillSans-Italic", size: 15)
            name.placeholder = "الاسم "
            // display when click on it
            name.textAlignment = .right
            name.layer.cornerRadius = 25
            view.addSubview(name)
            
        
            
            // label Email
            labelEmail.frame = CGRect(x: 250, y: 350, width: 200, height: 50)
            labelEmail.text = "البريد الالكتروني "
            labelEmail.font = UIFont(name: "GillSans-Italic", size: 19)
            labelEmail.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
            view.addSubview(labelEmail)
            
            
            //  textField for Email
            email.frame = CGRect(x: 35, y: 400, width: 320, height: 45)
            email.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
            
    //        ImgeInTextField(textField: textField2, fieldImge: textField2Image!)
            
            email.text = "jjjj@jj.com"
            email.font = UIFont(name: "GillSans-Italic", size: 15)
            email.placeholder = "ادخل البريد الالكتزوني" // display when click on it
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
            
    //        ImgeInTextField(textField: textField1, fieldImge: textField1Image!)
            password.font = UIFont(name: "GillSans-Italic", size: 15)
            password.isSecureTextEntry = true
            password.text = "123456"

            password.placeholder = "ادخل كلمه المرور" // display when click on it
            password.textAlignment = .right
            password.layer.cornerRadius = 25
            view.addSubview(password)

           
            
            

            
            
            buttonGoogle.frame = CGRect(x: 180, y: 700, width: 50, height: 50)
            buttonGoogle.layer.cornerRadius = 25
            buttonGoogle.setTitleColor( #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1) , for: .normal)
            buttonGoogle.setBackgroundImage(UIImage(named: "btn"), for: .normal)
            buttonGoogle.titleLabel?.font = UIFont(name: "GillSans-Italic", size: 23)
            buttonGoogle.addTarget(self, action: #selector(logInGoogle), for: .touchDown)
            view.addSubview(buttonGoogle)
            
            // label log in
            labelsingGog.frame = CGRect(x: 100, y: 630, width: 300, height: 50)
            labelsingGog.text = "-------- التسجيل بواسطة  ---------"
            labelsingGog.font = UIFont(name: "GillSans-Italic", size: 19)
            labelsingGog.textColor = .gray
            view.addSubview(labelsingGog)
            
            // label log in
            labelLog.frame = CGRect(x: 200, y: 760, width: 200, height: 50)
            labelLog.text = "هل تملك حساب مسجل ؟"
            labelLog.font = UIFont(name: "GillSans-Italic", size: 19)
            labelLog.textColor = .gray
            view.addSubview(labelLog)
            
            
            
            
            //MARK: - HidePasswordButton
            
            showPasswordButtonn.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            showPasswordButtonn.tintColor = .lightGray
            showPasswordButtonn.frame = CGRect(x: 30, y: 491, width: 60, height: 60)
            showPasswordButtonn.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
            view.addSubview(showPasswordButtonn)

            
           
            
        }
       

           
    @objc func logInGoogle() {
            let clentid = FirebaseApp.app()?.options.clientID
            let configer = GIDConfiguration(clientID: clentid!)

            //or copy the client iD from google Service
            GIDSignIn.sharedInstance.signIn(with: configer , presenting: self) { GoogleUser , error in
                if error == nil {
                    let authntcation = GoogleUser?.authentication
                    let idtoken = authntcation?.idToken
                    //يزودنا بالمعلومات اللي احتاجها لتسجيل الخول
                    let auth = GoogleAuthProvider.credential(withIDToken: idtoken!, accessToken: authntcation!.accessToken)
                    Auth.auth().signIn(with: auth) { user, error in
                        if error == nil {
                            
                          
                            let homevc = TabBar()
                            homevc.modalPresentationStyle = .fullScreen
                            self.present(homevc, animated: true, completion: nil)
                        }
                    }
                }
            }

          
            
        }
    
      @objc func hidePassword() {
            password.isSecureTextEntry.toggle()
            if password.isSecureTextEntry {
                showPasswordButtonn.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            } else {
                showPasswordButtonn.setImage(UIImage(systemName: "eye"), for: .normal)
            }
        }
         

                
    }




