//
//  HomeViewController.swift
//  WantToGo
//
//  Created by zhangpan on 15/10/30.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import Foundation
import UIKit

class TGHomeViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
     @IBOutlet var syncButton: UIBarButtonItem!
     @IBOutlet var settingButton: UIBarButtonItem!
     @IBOutlet var mTableView: UITableView!

     @IBAction func onClickSyncButton(btn: UIBarButtonItem) {
          print("click Sync Button : \(btn)")
     }

     @IBAction func onClickSettingButton(btn: UIBarButtonItem) {
          print("click Sync Set Button : \(btn)")
     }

     override func viewDidLoad() {
          super.viewDidLoad()

          mTableView.delegate = self
          mTableView.dataSource = self

          print("TableView - x: \(mTableView.frame.origin.x) y: \(mTableView.frame.origin.y) w: \(mTableView.frame.size.width) h: \(mTableView.frame.size.height)")
     }
    
    
    //pragma mark - UITableViewDataSource
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
          return 1
     }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 5
     }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
          let TripCellIdentifier = "TripCell"
        
          var cell: UITableViewCell? = mTableView.dequeueReusableCellWithIdentifier(TripCellIdentifier)
          if cell == nil {
               cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: TripCellIdentifier)
          }
     
          cell!.textLabel?.text = "Hello"
        
          return cell!
     }
     
     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return "Header Title"
     }
    
/*
     func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
          return nil
     }

     func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
          return 0
     }

     func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
          return nil
     }

     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            
     }

     func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
          return false
     }

     func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
          return false
     }

     func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
     
     }
*/
    
/*
    //pragma mark - UITableViewDelegate
     func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
          return nil
     }

     func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
     
     }
*/
    
    
}