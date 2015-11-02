//
//  TGSettingViewController.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/2.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

class TGSettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.mTableView = UITableView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height), style: UITableViewStyle.Grouped)
//        self.view.addSubview(mTableView!)
        
        mTableView!.dataSource = self
        mTableView!.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    
    
    
    /*
    ====== UITableView Delegate ======
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let SettingCellIdentifier = "SettingCell"
        
        var cell: UITableViewCell? = mTableView?.dequeueReusableCellWithIdentifier(SettingCellIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: SettingCellIdentifier)
        }
        
        if indexPath.section != 2 {
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
        }
        
        switch indexPath.section {
            case 0 :
                if indexPath.row == 0 {
                    
                    cell!.textLabel?.text = "头像"
                    let xl = cell!.frame.size.width - 68
                    let imgview = UIImageView.init(frame: CGRectMake(xl, 10, 68, 68))
                    imgview.backgroundColor = UIColor.redColor()
                    cell!.addSubview(imgview)
                    
                } else if indexPath.row == 1 {
                    cell!.textLabel?.text = "用户名"
                } else if indexPath.row == 2 {
                    cell!.textLabel?.text = "密码"
                }

            case 1 :
                cell!.textLabel?.text = "反馈意见"

            case 2 :
                cell!.textLabel?.textAlignment = NSTextAlignment.Center
                cell!.textLabel?.textColor = UIColor.redColor()
                cell!.textLabel?.text = "退出登录"

            default :
                break

        }
        
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
    
    
    /*
    ====== UITableView Delegate ======
    */
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return 88
        }
        
        return 44
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18
    }
    
    /*
    //pragma mark - UITableViewDelegate
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    return nil
    }
    */


    
}
