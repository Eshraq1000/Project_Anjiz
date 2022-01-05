//
//  ProfileVc.swift
//  Anjiz
//
//  Created by esho on 01/06/1443 AH.
//

import UIKit
import Firebase

class ProfileVc: UIViewController {

    let db = Firestore.firestore()
        let email = Auth.auth().currentUser!.email!
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let signOutButton = UINavigationItem()
        let lineView = UIView()
        let profileImage = UIImageView()
        let emailLable = UILabel()
        let NameLable = UILabel()
        let scoreLable = UILabel()
        let numberOfTreesLable = UILabel()
        let tracking = UIButton()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            //MARK: - SignOutButton
            let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
            let largeBoldArrow = UIImage(systemName: "rectangle.portrait.and.arrow.right", withConfiguration: largeConfig)
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: largeBoldArrow, style: .plain, target: self, action: #selector(signOut))
            navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            //MARK: - SeparatorLine
            lineView.backgroundColor = #colorLiteral(red: 0.9411765933, green: 0.9411765337, blue: 0.9411766529, alpha: 1)
            lineView.frame = CGRect(x: 0 , y: 90, width: view.frame.size.width, height: 3)
            view.addSubview(lineView)
            //MARK: - ProfileImage
            profileImage.image = UIImage(systemName: "person.crop.circle")
            profileImage.frame = CGRect(x: 145, y: 130, width: 100, height: 100)
            profileImage.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            view.addSubview(profileImage)
            //MARK: - EmailLabel
            
            NameLable.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            NameLable.frame = CGRect(x: 0, y: 240, width: 385, height: 50)
            NameLable.font = .systemFont(ofSize: 25, weight: .semibold)
            NameLable.textAlignment = .center
            view.addSubview(NameLable)
            
            
            


            NameLable.text = ""
            NameLable.frame = CGRect(x: 20, y: 360, width: 350, height: 35)
            view.addSubview(NameLable)
            getData()
            

            let treeimage = UIImageView()
            treeimage.image = UIImage(named: "p16")
            treeimage.frame = CGRect(x: 25, y: 600, width: 350, height: 100)
            treeimage.contentMode = .scaleAspectFill
            view.addSubview(treeimage)
        }
      
        //MARK: - Methods
        @objc func signOut() {
            let alert = UIAlertController(title: "تنبيه", message: "هل أنت متأكد أنك تريد تسجيل الخروج؟", preferredStyle: .actionSheet)
                  let action = UIAlertAction(title: "تسجيل الخروج", style: .destructive) { action in
                      
                      do {
                          try Auth.auth().signOut()
                          self.dismiss(animated: true, completion: nil)
                      } catch {
                          print(error.localizedDescription)
                      }
                  }
                  
                  alert.addAction(action)
                  alert.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
                  present(alert, animated: true, completion: nil)
                  
              }
         

        func getData(){
            db.collection("Users").whereField("email", isEqualTo: Auth.auth().currentUser!.email!)

                .getDocuments { querySnapshot, error in

                    if error == nil {

                        let name = querySnapshot?.documents[0].get("name")!
                        self.NameLable.text = "\(name!)"


                    } else {
                        print(error!.localizedDescription)
                    }
                }
        }
    }

