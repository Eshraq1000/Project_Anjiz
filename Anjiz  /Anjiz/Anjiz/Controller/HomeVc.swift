//
//  HomeVc.swift
//  Anjiz
//
//  Created by esho on 17/06/1443 AH.
//

import UIKit

class HomeVc: UIViewController {

 
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var Addproj: UIButton!
    
    @IBOutlet weak var meeting: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UI()



    }
    
    func UI() {
        img1.image = UIImage(named: "1")
       
        img1.frame = CGRect(x: 0, y: 0 , width: 400, height: 500)
        view.addSubview(img1)
        
        img2.image = UIImage(named: "2")

        img2.frame = CGRect(x: 0, y: 370 , width: 500, height: 500)
        view.addSubview(img2)
        
        
        
        Addproj.frame = CGRect(x: 30, y: 400, width: 150, height: 50)
        Addproj.layer.cornerRadius = 25
        
        meeting.frame = CGRect(x: 200, y: 400, width: 140, height: 50)
        meeting.layer.cornerRadius = 25
       
        
        
        
        
        
        
        
        
    }
    


}
