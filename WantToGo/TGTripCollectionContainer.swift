//
//  TGTripCollectionContainer.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/3.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

protocol TripCollectionContainerDelegate : class {
    func showMapController()
    func showListController()
}

class TGTripCollectionContainer: UIViewController, TripCollectionContainerDelegate {
    
    let mapNavViewController: UINavigationController
    let mapvc: TGTripCollection_MapController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TGTripCollection_MapController") as! TGTripCollection_MapController
    let listNavViewController: UINavigationController
    let listvc: TGTripCollection_ListController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TGTripCollection_ListController") as! TGTripCollection_ListController
    
    
    
    /*=================== override ===================*/
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.mapNavViewController = UINavigationController(rootViewController: mapvc)
        self.listNavViewController = UINavigationController(rootViewController: listvc)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        self.mapNavViewController = UINavigationController(rootViewController: mapvc)
        self.listNavViewController = UINavigationController(rootViewController: listvc)
        super.init(coder: aDecoder)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapvc.delegate = self
        listvc.delegate = self
        self.displayContentViewController(viewController: mapNavViewController)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /*=================== Method ===================*/
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
    

}
