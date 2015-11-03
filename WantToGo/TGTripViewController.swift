//
//  TGTripViewController.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/2.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class TGTripViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController!.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController!.setNavigationBarHidden(false, animated: true)
    }

}
