//
//  ChatMassegeVC.swift
//  Anjiz
//
//  Created by esho on 17/06/1443 AH.
//

import UIKit
import Firebase
class ChatMassegeVC: UIViewController {

    let url = Firestore.firestore()

    
    @IBOutlet weak var TableViewChat: UITableView!
    
   
    
    @IBOutlet weak var TextFiledForMsg: UITextField!
    
    
    var arrListMsg:[MsgStruct] = []
    var userID:String?
    var userName:String?
    let myID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewChat.delegate = self
        TableViewChat.dataSource = self
        
        reloadAllMsg(idUser: userID!)
    }
    
    func reloadAllMsg(idUser:String){
        arrListMsg.removeAll()

        url.collection("Users").document(myID ?? "h").collection("Chat").document(self.userID!).collection("Message").order(by: "date").addSnapshotListener { snapShot, error in
            self.arrListMsg.removeAll()
            print("_+_+_+_+_+_+")
            for id in snapShot!.documents {
                print(id.documentID)
                print("content",id.get("content")!)

                
                self.arrListMsg.append( MsgStruct(id: id.get("idUser")! as! String, content: id.get("content")! as! String))
                
            }
            self.TableViewChat.reloadData()
        }
    }

  
    
    
   
    @IBAction func SendMessage(_ sender: Any) {
    
    
    let msg = [
                   "idUser":myID,
                   "date":dateSend(),
                   "content":TextFiledForMsg.text!]
        url.collection("Users").document(myID!).collection("Chat").document(userID!).collection("Message").document().setData(msg)
//        url.collection("Users").document(userID!).collection("Chat").document(myID!).collection("Message").document().setData(msg)
        reloadAllMsg(idUser:userID!)
    }

    func dateSend()->String{
        let format = DateFormatter()
        format.dateFormat = "dd/mm/yyyy hh:mm:ss a"
        let date = format.string(from: Date())
        return date
    }

}


extension ChatMassegeVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrListMsg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewChat.dequeueReusableCell(withIdentifier: "MsgCell", for: indexPath) as! MsgCell
        if myID == arrListMsg[indexPath.row].id {
            cell.nameUser.text = " Me"
            cell.msg.text = arrListMsg[indexPath.row].content
        }else{
            cell.nameUser.text = "Other User"
            cell.msg.text = arrListMsg[indexPath.row].content
        }
        
        return cell
    }
    
    
}

struct MsgStruct {
    var id:String
    var content:String
    init(id:String,content:String){
        self.id = id
        self.content = content
    }
}
