//
//  TGTripCollection_MapController.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/3.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit
import MapKit

class TGTripCollection_MapController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: TripCollectionContainerDelegate?
    var state: Bool = true
    var mapView: MKMapView?
    var listTableView: UITableView?
    
    @IBOutlet var mapContainer: UIView!
    @IBOutlet var ListContainer: UIView!
    @IBOutlet var mapviewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var mapviewRatioConstraint: NSLayoutConstraint!
    @IBOutlet var layoutButton: UIButton!
    
    @IBAction func onClickHomeBtn() {
        Home_NavigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func onClickListBtn() {
        delegate?.showListController()
    }
    

    
    /*=================== override ===================*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init layout
        mapviewBottomConstraint.priority = UILayoutPriorityDefaultHigh
        if state {
            mapviewRatioConstraint.priority = UILayoutPriorityDefaultHigh-1
        } else {
            mapviewRatioConstraint.priority = UILayoutPriorityDefaultHigh+1
        }
        
        // init layout button
        layoutButton.addTarget(self, action: "updateMapListLayout", forControlEvents: UIControlEvents.TouchUpInside)

        // init mapview
        mapView = MKMapView()
        assert(mapView != nil, "#Error :# MKMapView init fail")
        if mapView != nil {
            mapView!.translatesAutoresizingMaskIntoConstraints = false
            mapContainer.addSubview(mapView!)

            NSLayoutConstraint(item: mapView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: mapContainer, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0).active = true
            NSLayoutConstraint(item: mapView!, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: mapContainer, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0).active = true
            NSLayoutConstraint(item: mapView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: mapContainer, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0).active = true
            NSLayoutConstraint(item: mapView!, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: mapContainer, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0).active = true
            
            let mapCenter = CLLocationCoordinate2D(latitude: 50.12112, longitude: 1.558)
            let mapSpan = MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
            mapView!.region = MKCoordinateRegion(center: mapCenter, span: mapSpan)
        }
        
        // init listview
        listTableView = UITableView()
        assert(listTableView != nil, "#Error :# UITableView init fail")
        if listTableView != nil {
            listTableView!.translatesAutoresizingMaskIntoConstraints = false
            listTableView!.delegate = self
            listTableView!.dataSource = self
            listTableView!.tableFooterView = UIView(frame: CGRectZero)
            self.automaticallyAdjustsScrollViewInsets = false
            ListContainer.addSubview(listTableView!)
            
            NSLayoutConstraint(item: listTableView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: ListContainer, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0).active = true
            NSLayoutConstraint(item: listTableView!, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: ListContainer, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0).active = true
            NSLayoutConstraint(item: listTableView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: ListContainer, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0).active = true
            NSLayoutConstraint(item: listTableView!, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: ListContainer, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0).active = true
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Fix a problem: The height of navigationbar changes after animation.
        self.navigationController?.navigationBar.layer.removeAllAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    /*=================== Method ===================*/
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
    
    
    
    
    
    /*====== UITableView DataSourceDelegate ======*/
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        let dataCount = 10
        tableView.tableViewDisplay(Massage: "暂无收集的数据", ifNessaryForRowCount: UInt(dataCount))
        
        if dataCount == 0 {
            return 0
        }
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let SlideListCell = "SlideListCell"
        
        var cell: UITableViewCell? = listTableView!.dequeueReusableCellWithIdentifier(SlideListCell)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: SlideListCell)
        }
        
        cell!.accessoryType = UITableViewCellAccessoryType.None
        cell!.textLabel?.text = "伦敦"
        
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
