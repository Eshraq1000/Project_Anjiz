//
//  TableProject.swift
//  Anjiz
//
//  Created by esho on 16/06/1443 AH.
//

import UIKit

class TableProject: UIViewController , UIViewControllerTransitioningDelegate {

    
    @IBOutlet weak var tableview: UITableView!
    
    
 
    @IBOutlet weak var menuButton: UIButton!
    
    let transition = CircularTransition()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2
        



    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! AddProjectVC
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
        func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            transition.transitionMode = .present
            transition.startingPoint = menuButton.center
            transition.circleColor = menuButton.backgroundColor!
            
            return transition
        }
        
        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            transition.transitionMode = .dismiss
            transition.startingPoint = menuButton.center
            transition.circleColor = menuButton.backgroundColor!
            
            return transition
        }
        

         func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }



}
}

//MARK: -UITableView
extension TableProject: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        events.count
        
        
        
    }
    
    func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell") as! ProjectCell
   
//        cell.userNameLB.text = events[indexPath.row].name
//        cell.UserEmailLB.text = events[indexPath.row].email

        cell.backgroundColor = .yellow
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    

    // MARK: Did select
    // press in cell ->
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
     

//       selectedEvent = events[indexPath.row]
////
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "Taskvc") as? TaskViewController {
//            vc.taskUser = events[indexPath.row].name
//
            
        
//
//        print(indexPath.row)
//        // var indexNumber: Int = 0
//        indexNumber = indexPath.row
//        performSegue(withIdentifier: "Taskseg", sender: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Taskseg" {
            // To another View
//            var secondVC = segue.destination as! TaskViewController
//            //From another View var imageName: String? = name Array [var Up]
//            secondVC.taskUser = events[indexNumber].name
        }
    }
        
//            //var struct = var Array
//            selectedEvent = events[indexPath.row]
//             performSegue(withIdentifier: "Taskseg", sender: nil)
//        }
//
//            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                if segue.identifier == "Taskseg" {
//                    let nextVc = segue.destination as! TaskViewController
//                    nextVc.selectedEvent = selectedEvent
//                }
//            }
//
            
  


    




