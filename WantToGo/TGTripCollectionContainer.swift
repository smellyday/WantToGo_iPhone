//
//  TGTripCollectionContainer.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/3.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class TGTripCollectionContainer: UIViewController {
    
    // init 
    let mapvc: UINavigationController = UIStoryboard(name: "TripCollection", bundle: nil).instantiateViewControllerWithIdentifier("TGTripCollection_MapNavigation") as! UINavigationController
    let listvc: UINavigationController = UIStoryboard(name: "TripCollection", bundle: nil).instantiateViewControllerWithIdentifier("TGTripCollection_ListNavigation") as! UINavigationController
    
    override func awakeFromNib() {
        self.tabBarItem.title = "收集"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.displayContentViewController(mapViewController: mapvc, listViewController: listvc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayContentViewController(mapViewController mapViewController: UIViewController, listViewController: UIViewController) {
        self.addChildViewController(mapvc)
        self.addChildViewController(listvc)
        
        mapvc.view.frame = self.view.bounds
        self.view.addSubview(mapvc.view)
        
        listvc.view.frame = CGRectMake(-self.view.frame.size.width, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(listvc.view)
        
        mapvc.didMoveToParentViewController(self)
        listvc.didMoveToParentViewController(self)
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
