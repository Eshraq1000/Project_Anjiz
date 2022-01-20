//
//  ChatHomeVC.swift
//  Anjiz
//
//  Created by esho on 17/06/1443 AH.
//

import UIKit
import Firebase
class ChatHomeVC: UIViewController {
    
    var arrUser:[User] = []
    let db = Firestore.firestore()
    var sendUserID:String?
    var sendUserName:String?

    @IBOutlet weak var TableViewUsers: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableViewUsers.delegate = self
        TableViewUsers.dataSource = self
}
override func viewWillAppear(_ animated: Bool) {
    getUser()
    
}


func getUser() {
db.collection("Users").getDocuments {
    querySnapshot, error in
    self.arrUser = []
    if let error = error {
        print("Error: ",error.localizedDescription)
    }else {
        for document in querySnapshot!.documents {
            let data = document.data()
            let nameuser = data["name"] as? String ?? "nil"
            let id = data ["userID"] as? String
         
            // def let = Struct Model (var inside Struct: var inside for )
            let newEvent = User(name:nameuser , id :  id )
            self.arrUser.append(newEvent)
            print(self.arrUser)
        }
        DispatchQueue.main.async {
            self.TableViewUsers.reloadData();                    if self.arrUser.isEmpty {
//                    self.TableViewUsers.setEmptyMessage("لايوجد مستخدم بهذا الاسم")
            }
        }
       

}
}
}




    
    
@IBAction func signOutAction(_ sender: Any) {

                do {
                    try Auth.auth().signOut()
                    dismiss(animated: true, completion: nil)
                }catch {
                    print(error)
                }
    }

    struct User {
        var name:String?
        var id:String?

        }
    }
  



// MARK: Table View
extension ChatHomeVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewUsers.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserShowCell
        cell.Nameuser.text = arrUser[indexPath.row].name
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendUserID = arrUser[indexPath.row].id
        sendUserName = arrUser[indexPath.row].name
        performSegue(withIdentifier: "moveChat", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveChat"
        {
            let vcChat = segue.destination as! ChatMassegeVC
            vcChat.userID = sendUserID
            vcChat.userName = sendUserName
            
        }
    }
}




