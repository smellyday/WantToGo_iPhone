//
//  TGTripCollection_ListController.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/3.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class TGTripCollection_ListController: UIViewController {
    
    weak var delegate: TripCollectionContainerDelegate?

    @IBAction func onClickHomeBtn() {
        Home_NavigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func onClickMapBtn() {
        delegate?.showMapController()
    }
    
    
    
    /*=================== override ===================*/
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
