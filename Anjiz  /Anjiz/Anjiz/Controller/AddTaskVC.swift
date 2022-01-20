//
//  AddTaskVC.swift
//  Anjiz
//
//  Created by esho on 16/06/1443 AH.
//

import UIKit
import Firebase
class AddTaskVC: UIViewController {
    let db = Firestore.firestore()
    var taskUser = ""
    var projectName = ""
    @IBOutlet weak var ProjectNameLB: UILabel!
    
    @IBOutlet weak var DeadlineTask: DatePickClass!
    
    let TaskNameLB = UILabel()
    let TaskNameTF = UITextField()
    
    
    let TaskAssiLB = UILabel()
    let TaskuserLB = UILabel()
    
    let TaskDeadlineLB = UILabel()

    
    @IBOutlet weak var AddTaskBt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        UI()
        TaskuserLB.text = taskUser
        ProjectNameLB.text = projectName

        
    
    

    }
    
    func sendTaskToFirebase(){
       db.collection("Task").document().setData(

           ["TaskName" : self.TaskNameTF.text!,
            "TaskUser" : self.TaskuserLB.text! ,
            "DeadlineTask" : self.DeadlineTask.text!,
            "userID" :Auth.auth().currentUser!.uid
            
           ])
    }
    func UI(){
        
        AddTaskBt.layer.cornerRadius = AddTaskBt.frame.size.width / 2
        
        // label Task Name
        TaskNameLB.frame = CGRect(x: 250, y: 450, width: 200, height: 50)
        TaskNameLB.text = "اسم المهمه :"
        TaskNameLB.font = UIFont(name: "GillSans-Italic", size: 19)
        TaskNameLB.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(TaskNameLB)
        
        
        
        
        //  textField for Name Task
        TaskNameTF.frame = CGRect(x: 35, y: 500, width: 320, height: 45)
        TaskNameTF.backgroundColor = .white
        TaskNameTF.font = UIFont(name: "GillSans-Italic", size: 15)
        TaskNameTF.textAlignment = .right
        TaskNameTF.layer.cornerRadius = 15
        view.addSubview(TaskNameTF)
        
        
        // label Task Name User
        TaskAssiLB.frame = CGRect(x: 250, y: 580, width: 200, height: 50)
        TaskAssiLB.text = "منفذ المهمه :"
        TaskAssiLB.font = UIFont(name: "GillSans-Italic", size: 19)
        TaskAssiLB.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(TaskAssiLB)
        
        // label Task Name User
        TaskuserLB.frame = CGRect(x: 200, y: 580, width: 200, height: 50)
        TaskuserLB.text = ""
        TaskuserLB.font = UIFont(name: "GillSans-Italic", size: 19)
        TaskuserLB.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(TaskuserLB)
        
    
        
        
        
        // label Task Deadline
        TaskDeadlineLB.frame = CGRect(x: 250, y: 650, width: 200, height: 50)
        TaskDeadlineLB.text = "موعد التسليم :"
        TaskDeadlineLB.font = UIFont(name: "GillSans-Italic", size: 19)
        TaskDeadlineLB.textColor = #colorLiteral(red: 0.2687272429, green: 0.3382961154, blue: 0.2888988853, alpha: 1)
        view.addSubview(TaskDeadlineLB)
        
        
       
        
        //  textView for Details Project
//        ProjectDetailsTV.frame = CGRect(x: 35, y: 350, width: 320, height: 300)
//        ProjectDetailsTV.backgroundColor = #colorLiteral(red: 0.9417493416, green: 0.9417493416, blue: 0.9417493416, alpha: 1)
//        ProjectDetailsTV.font = UIFont(name: "GillSans-Italic", size: 15)
//        // display when click on it
//        ProjectDetailsTV.textAlignment = .right
//        ProjectDetailsTV.layer.cornerRadius = 25
//        view.addSubview(ProjectDetailsTV)
    }
   
     // MARK: Button Action
    
    
    
    @IBAction func AddTaskBtn(_ sender: Any) {
        sendTaskToFirebase()
       
       
        
        
        
    }
    
    

}
