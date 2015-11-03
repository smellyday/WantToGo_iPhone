//
//  TGTripCollectionContainer.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/3.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

protocol TripCollectionContainerDelegate {
    func showMapController()
    func showListController()
}

class TGTripCollectionContainer: UIViewController, TripCollectionContainerDelegate {
    
    // init 
    var navController: UINavigationController!
    var mapvc: TGTripCollection_MapController = UIStoryboard(name: "TripCollection", bundle: nil).instantiateViewControllerWithIdentifier("TGTripCollection_MapController") as! TGTripCollection_MapController
    var listvc: TGTripCollection_ListController = UIStoryboard(name: "TripCollection", bundle: nil).instantiateViewControllerWithIdentifier("TGTripCollection_ListController") as! TGTripCollection_ListController
    
    override func awakeFromNib() {
        self.tabBarItem.title = "收集"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navController = UINavigationController(rootViewController: mapvc)
        mapvc.delegate = self
        self.displayContentViewController(viewController: mapvc)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayContentViewController(viewController viewController: UIViewController) {
        self.addChildViewController(navController)
        
        navController.view.frame = self.view.bounds
        self.view.addSubview(navController.view)
        
        navController.didMoveToParentViewController(self)
        
    }
    
    /*====== TripCollectionContainerDelegate ======*/
    func showMapController() {
        
    }
    
    func showListController() {
        listvc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        mapvc.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        mapvc.definesPresentationContext = true
        mapvc.presentViewController(listvc, animated: true, completion: nil)
    }
    
    func backToHomePage() {
        
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
