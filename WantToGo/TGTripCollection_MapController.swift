//
//  TGTripCollection_MapController.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/3.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class TGTripCollection_MapController: UIViewController {
    
    var mapView: UIView!
    var slideListView: UIView!
    var delegate: TripCollectionContainerDelegate?
    
    var listViewHidePos: CGRect!
    var listViewShowPos: CGRect!
    
    @IBAction func onClickHomeBtn() {
        Home_NavigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func onClickListBtn() {
        delegate?.showListController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView = UIView(frame: self.view.bounds)
        mapView.backgroundColor = UIColor.redColor()
        self.view.addSubview(mapView)
        
        let list_x = self.view.frame.origin.x
        let list_y = mapView.frame.size.height
        let list_w = self.view.frame.size.width
        let list_h = self.view.frame.size.height - mapView.frame.size.width / 1.13
        listViewHidePos = CGRectMake(list_x, list_y, list_w, list_h)
        slideListView = UIView(frame: self.listViewHidePos)
        self.view.addSubview(slideListView)

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
