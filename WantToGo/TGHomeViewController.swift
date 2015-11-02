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

     override func viewDidLoad() {
          super.viewDidLoad()

          mTableView.delegate = self
          mTableView.dataSource = self
          mTableView.tableFooterView = UIView(frame: CGRectZero)
          self.automaticallyAdjustsScrollViewInsets = false
          
     }
    
    
     /*====== UITableView DataSourceDelegate ======*/
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

     /*    
     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return "Header Title"
     }


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



     /*====== UITableView Delegate ======*/
     /*
     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
          
     }
     */

     /*
     func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {

     }
     */

     /*
     func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
          
     }
     */

     /*
     func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
          
     }
     */

     /*
     func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
          
     }
     */

     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
          tableView.deselectRowAtIndexPath(indexPath, animated: true)
     }

     /*
     func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
          
     }
     */

     /*
     func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          
     }
     */

     /*
     func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
          
     }
     */

     /*
     func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          
     }
     */

     /*
     func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
          
     }
     */

     /*
     func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
          
     }
     */

     /*
     func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
          
     }
     */

     /*
     func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
          
     }
     */

     /*
     func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
          
     }
     */

     /*
     func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
          
     }
     */

     /*
     func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
          
     }
     */

     /*
     func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
          
     }
     */

     /*
     func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
          
     }
     */

     /*
     func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
          
     }
     */

     /*
     func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
          
     }
     */

     /*
     func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
          
     }
     */
    
}