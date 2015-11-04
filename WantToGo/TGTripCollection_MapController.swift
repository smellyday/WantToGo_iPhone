//
//  TGTripCollection_MapController.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/3.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit
import MapKit

class TGTripCollection_MapController: UIViewController {
    
//    var mapView: MKMapView!
//    var slideListView: UIView!
    weak var delegate: TripCollectionContainerDelegate?
    var state: Bool = true
    
//
//    var mapViewBigPos: CGRect!
//    var mapViewSmallPos: CGRect!
//    var listViewHidePos: CGRect!
//    var listViewShowPos: CGRect!
    
    @IBOutlet var mapContainerView: UIView!
    @IBOutlet var ListContainerView: UIView!
    @IBOutlet var mapviewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var mapviewRatioConstraint: NSLayoutConstraint!
    
    @IBAction func onClickHomeBtn() {
        Home_NavigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func onClickListBtn() {
        delegate?.showListController()
    }
    
    func updateMapListLayout() {
        state = !state
        
        
//        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.25, animations: {
            
            if self.state {
                self.mapviewBottomConstraint.priority = UILayoutPriorityDefaultHigh+1
                self.mapviewRatioConstraint.priority = UILayoutPriorityDefaultHigh-1
            } else {
                self.mapviewBottomConstraint.priority = UILayoutPriorityDefaultHigh-1
                self.mapviewRatioConstraint.priority = UILayoutPriorityDefaultHigh+1
            }
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if state {
            mapviewBottomConstraint.priority = UILayoutPriorityDefaultHigh+1
            mapviewRatioConstraint.priority = UILayoutPriorityDefaultHigh-1
        } else {
            mapviewBottomConstraint.priority = UILayoutPriorityDefaultHigh-1
            mapviewRatioConstraint.priority = UILayoutPriorityDefaultHigh+1
        }
        
        let btn = UIButton(frame: CGRectMake(100, 100, 100, 100))
        btn.backgroundColor = UIColor.redColor()
        btn.addTarget(self, action: "updateMapListLayout", forControlEvents: UIControlEvents.TouchUpInside)
        mapContainerView.addSubview(btn)

        // init position of two views.
//        mapViewBigPos = self.view.bounds
//        mapViewSmallPos = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width / 1.13)
//        
//        listViewHidePos = CGRectMake(0, 800, mapViewBigPos.size.width, 300)
//        listViewShowPos = CGRectMake(0, 400, mapViewBigPos.size.width, 300)
        
        // init MapView
//        mapView = MKMapView()
//        slideListView = UIView()
//        
//        mapView.leadingAnchor.constraintEqualToAnchor(self.view.layoutMarginsGuide.leadingAnchor).active = true
//        mapView.topAnchor.constraintEqualToAnchor(self.view.layoutMarginsGuide.topAnchor).active = true
//        mapView.trailingAnchor.constraintEqualToAnchor(self.view.layoutMarginsGuide.trailingAnchor).active = true
//        mapView.bottomAnchor.constraintEqualToAnchor(self.view.layoutMarginsGuide.bottomAnchor).active = true
//        self.view.addSubview(mapView)
        
        
//        mapView = MKMapView(frame: mapViewBigPos)
//        let mapCenter = CLLocationCoordinate2D(latitude: 50.12112, longitude: 1.558)
//        let mapSpan = MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
//        mapView.region = MKCoordinateRegion(center: mapCenter, span: mapSpan)
//        self.view.addSubview(mapView)
        
        // init ListView
//        slideListView = UIView(frame: listViewHidePos)
//        slideListView.backgroundColor = UIColor.redColor()
//        self.view.addSubview(slideListView)

    }
    
    override func viewWillAppear(animated: Bool) {
        // Fix a problem: The height of navigationbar changes after animation.
        self.navigationController?.navigationBar.layer.removeAllAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
