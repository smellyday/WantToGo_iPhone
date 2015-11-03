//
//  TGTrip_InfoViewControlelr.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/2.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class TGTrip_InfoViewControlelr: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var headImageView: UIImageView!
    @IBOutlet var mTableView: UITableView!
    
    @IBAction func onClickHomeButton() {
        Home_NavigationController.popViewControllerAnimated(true)
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
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let TripInfoCellIdentifier = "TripInfoCell"
        
        var cell: UITableViewCell? = mTableView.dequeueReusableCellWithIdentifier(TripInfoCellIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: TripInfoCellIdentifier)
        }
        
        cell!.accessoryType = UITableViewCellAccessoryType.None
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        
        if indexPath.section == 0 {
            cell!.textLabel?.text = "法瑞德16日家庭之旅"
        } else if indexPath.section == 1 {
            cell!.textLabel?.text = "2015年06月07日"
        } else if indexPath.section == 2 {
            cell!.textLabel?.text = "2015年06月15日"
        }

        return cell!
    }
    

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "旅行标题"
        } else if section == 1 {
            return "出发日期"
        } else if section == 2 {
            return "结束日期"
        }
        
        return ""
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
    
    
    
    /*====== UITableView Delegate ======*/
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
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
    
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    */
    
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
        return 30
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
