//
//  UITableView+EmptyExtension.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/6.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit

extension UITableView {
    func tableViewDisplay(Massage msg: String, ifNessaryForRowCount rowCount: UInt) {
        if rowCount == 0 {
            let msgLabel = UILabel()
            msgLabel.text = msg
            msgLabel.textColor = UIColor.lightGrayColor()
            msgLabel.textAlignment = NSTextAlignment.Center
            msgLabel.sizeToFit()
            self.backgroundView = msgLabel
        } else {
            self.backgroundView = nil
        }
    }
}