//
//  TabBarVC.swift
//  Anjiz
//
//  Created by esho on 01/06/1443 AH.
//

import UIKit

class TabBarVC: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: ChatVc ())
        let vc2 = UINavigationController(rootViewController: HomeVc())
        let vc3 = UINavigationController(rootViewController: TaskVc())
        let vc4 = UINavigationController(rootViewController: ProfileVc())
        
        
        
        
        vc1.title = "تواصل"
        vc2.title = "الرئيسيه"
        vc3.title = "المهام"
        vc4.title = "الملف الشخصي"
        
        self.tabBar.semanticContentAttribute = .forceRightToLeft
        
        self.setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        
        
        
        guard let items = self.tabBar.items else {return}

        let images = ["message.circle","house","note.text","person"]

        for i in 0..<items.count {
            items[i].image = UIImage(systemName: images[i])
        }
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        self.modalPresentationStyle = .fullScreen
    }
}
    
    

