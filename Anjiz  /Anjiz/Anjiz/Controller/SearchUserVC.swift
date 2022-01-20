//
//  SearchUserVC.swift
//  Anjiz
//
//  Created by esho on 17/06/1443 AH.
//

import UIKit
import Firebase

class SearchUserVC: UIViewController {
    //def let can access to firestore
    let db = Firestore.firestore()
    //def var act current user Now
//    var userId = Auth.auth().currentUser?.uid
    //def var Take Struct Model inside to Araay
    var UserArray = [User]()
    //def var Take Struct Model
    var selectedUser:User?
    var indexNumber: Int = 0

    @IBOutlet weak var searchBer: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var searchBt: UIButton!
    
    @IBOutlet weak var ViewGray: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.showsVerticalScrollIndicator = false

        searchBer.delegate = self
        searchBer.isHidden = true
        ViewGray.isHidden = true

      
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        filterUser()
        
    }
    @IBAction func searchBtAction(_ sender: UIButton) {
        sender.pulsate()
        searchBer.isHidden = false
        ViewGray.isHidden = false
        

        
    }
    
    
    
    //MARK: - get specific documents from a collection
    
    func filterUser() {
        
        db.collection("Users").getDocuments {
            querySnapshot, error in
            self.UserArray = []
            if let error = error {
                print("Error: ",error.localizedDescription)
            }else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let nameuser = data["name"] as? String ?? "nil"
//                    let useremail = data ["email"] as? String
                 
                    // def let = Struct Model (var inside Struct: var inside for )
                    let newUser = User(name: nameuser)
                    self.UserArray.append(newUser)
                    
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData();                    if self.UserArray.isEmpty {
                        self.tableview.setEmptyMessage("لايوجد مستخدم بهذا الاسم")
                    }
                }
               

}
        }
    }
    
    
}
//MARK: -UITableView
extension SearchUserVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UserArray.count
        
        
        
    }
    
    func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! SearchUserCell
   
        cell.UserName.text = UserArray[indexPath.row].name
//        cell.UserEmailLB.text = events[indexPath.row].email

//        cell.ViewCell.layer.cornerRadius = cell.ViewCell.frame.height / 2
        cell.ViewCell.layer.cornerRadius = 30
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
//    func sendDatafromCellToFirebase(){
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchCell
//       db.collection("Tasks").document().setData(
//
//        ["projectUser" : cell.userNameLB.text!
//           ])
//
//    }
    // MARK: Did select
    // press in cell ->
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     

//       selectedEvent = events[indexPath.row]
////
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AddTask") as? AddTaskVC {
            vc.taskUser = UserArray[indexNumber].name
//
//        self.present(vc, animated: true, completion: nil)
            
            self.dismiss(animated: true, completion: nil)
            
            
        
        
        // var indexNumber: Int = 0
        indexNumber = indexPath.row
//        performSegue(withIdentifier: "Taskseg", sender: nil)
    }
    
        
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Taskseg" {
//            // To another View
//            var secondVC = segue.destination as! AddTaskVC
//            //From another View var imageName: String? = name Array [var Up]
//            secondVC.taskUser = UserArray[indexNumber].name
//        }
    }
        

            
            
            
            
            
            
          
//            self.navigationController?.pushViewController(vc, animated: true)
//            vc.Taskuser = "mnnm"
//            self.navigationController?.popViewController(animated: true)
//            performSegue(withIdentifier: "Taskseg", sender: nil)


        
        
        
        
//        sendDatafromSearchBarToFirebase()
//        selectedEvent = events[indexPath.row]
//        performSegue(withIdentifier: "moreEventDetails", sender: nil)
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "moreEventDetails" {
//            let nextVc = segue.destination as! EventDetailsVC
//            nextVc.selectedEvent = selectedEvent
//        }
//    }
   
}

    









//MARK: -UISearchBarDelegate
extension SearchUserVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
        
        
        
        
       
        if searchBar.text?.count == 0 {


            filterUser()
        }else {
            UserArray = UserArray.filter{$0.name.contains(searchBar.text!)}
            self.tableview.reloadData()
            print(searchBar.text ?? "")
        }
        tableview.reloadData()

    }
    
    
         

        
        
        
        
        
    
    
//    func updateSearchResults(for searchController : UISearchController) {
//
//        guard let text = searchController.searchBar.text else {
//        return
//        }
//        print(text)
//    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterUser()
    }
}

//extension SearchBarVC : UISearchBarDelegate{
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        events = []
//
//        if searchText == ""{
//           print("")
//        }
//        else{
//        for offer in  events {
//            if offer.name.lowercased().contains(searchText.lowercased()){
//                events.append(offer)
//            print("mikn")
//            }
//        }
//
//       // getOffers()
//       tableview.reloadData()
//    }
//}
//}

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}




