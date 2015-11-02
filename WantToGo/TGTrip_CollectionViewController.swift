//
//  TGTrip_CollectionViewController.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/2.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

var Trip_Collection_NavigationController: UINavigationController?

class TGTrip_CollectionViewController: UIViewController {
    
    @IBAction func onClickHomeButton() {
        Home_NavigationController.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Trip_Collection_NavigationController = self.navigationController
    }

}
