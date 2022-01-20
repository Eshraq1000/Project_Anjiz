//
//  AddProjectVC.swift
//  Anjiz
//
//  Created by esho on 16/06/1443 AH.
//

import UIKit
import Firebase
class AddProjectVC: UIViewController {
    
    let db = Firestore.firestore()
    var name = ""
    var details = ""

    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var AddProjectButton: UIButton!
    
    let ProjectNameLB = UILabel()
    let ProjectDetailsLB = UILabel()
    //field
    let ProjectNameTF = UITextField()
    let ProjectDetailsTV = UITextView()
  
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        UI()


    }
    
    // MARK: Function UI view
    func UI(){
        
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
        
        AddProjectButton.layer.cornerRadius = AddProjectButton.frame.size.width / 2
        
        // label Project Name
        ProjectNameLB.frame = CGRect(x: 250, y: 150, width: 200, height: 50)
        ProjectNameLB.text = "اسم المشروع :"
        ProjectNameLB.font = UIFont(name: "GillSans-Italic", size: 19)
        ProjectNameLB.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(ProjectNameLB)
        
        
        // label Project Details
        ProjectDetailsLB.frame = CGRect(x: 230, y: 300, width: 200, height: 50)
        ProjectDetailsLB.text = "تفاصيل المشروع :"
        ProjectDetailsLB.font = UIFont(name: "GillSans-Italic", size: 19)
        ProjectDetailsLB.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(ProjectDetailsLB)
        
        
        //  textField for Name Project
        ProjectNameTF.frame = CGRect(x: 35, y: 200, width: 320, height: 45)
        ProjectNameTF.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ProjectNameTF.font = UIFont(name: "GillSans-Italic", size: 15)
        ProjectNameTF.textAlignment = .right
        ProjectNameTF.layer.cornerRadius = 25
        view.addSubview(ProjectNameTF)
        
        //  textView for Details Project
        ProjectDetailsTV.frame = CGRect(x: 35, y: 350, width: 320, height: 300)
        ProjectDetailsTV.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
        ProjectDetailsTV.font = UIFont(name: "GillSans-Italic", size: 15)
        // display when click on it
        ProjectDetailsTV.textAlignment = .right
        ProjectDetailsTV.layer.cornerRadius = 25
        view.addSubview(ProjectDetailsTV)
    }
   
     // MARK: Button Action
    
    @IBAction func dismissSecondVC(_ sender: Any) {
    
    self.dismiss(animated: true, completion: nil)
    
    }
    @IBAction func AddProjectBt(_ sender: Any) {
        sendDataProjectToFirebase()
    }
    
    
    
    
    
    // MARK: function Firebase
    
         func sendDataProjectToFirebase(){
             let id = UUID().uuidString
            db.collection("Project").document(id).setData(
    
                [ "ProjectID": id ,
                  "projectN" : self.ProjectNameTF.text!,
                  "projectD" : self.ProjectDetailsTV.text! ,
                  "userID" :Auth.auth().currentUser!.uid
                
                ])
         }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddTaskVC {
            vc.projectName = ProjectNameTF.text!
        }
    }


}
