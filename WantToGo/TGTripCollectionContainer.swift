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
    
    var mapNavViewController: UINavigationController!
    var mapvc: TGTripCollection_MapController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TGTripCollection_MapController") as! TGTripCollection_MapController
    var listNavViewController: UINavigationController!
    var listvc: TGTripCollection_ListController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TGTripCollection_ListController") as! TGTripCollection_ListController
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.mapNavViewController = UINavigationController(rootViewController: mapvc)
        self.listNavViewController = UINavigationController(rootViewController: listvc)
        
        mapvc.delegate = self
        listvc.delegate = self
        self.displayContentViewController(viewController: mapNavViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayContentViewController(viewController viewController: UIViewController) {
        self.addChildViewController(viewController)
        
        viewController.view.frame = self.view.bounds
        self.view.addSubview(viewController.view)
        
        viewController.didMoveToParentViewController(self)
        
    }
    
    /*====== TripCollectionContainerDelegate ======*/
    func showMapController() {
        
        self.addChildViewController(mapNavViewController)
        listNavViewController.willMoveToParentViewController(nil)
        
        mapNavViewController.view.frame = self.view.bounds
        
        self.transitionFromViewController(listNavViewController, toViewController: mapNavViewController,
            duration: 0.25,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: nil,
            completion: {(finished: Bool) in
                self.mapNavViewController.didMoveToParentViewController(self)
        })
        
    }
    
    func showListController() {
        
        self.addChildViewController(listNavViewController)
        mapNavViewController.willMoveToParentViewController(nil)
        
        listNavViewController.view.frame = self.view.bounds
        
        self.transitionFromViewController(mapNavViewController, toViewController: listNavViewController,
            duration: 0.25,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: nil,
            completion: {(finished: Bool) in
                self.listNavViewController.didMoveToParentViewController(self)
        })
        
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
