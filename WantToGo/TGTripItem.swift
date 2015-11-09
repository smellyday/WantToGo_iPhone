//
//  TGTripItem.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/9.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import Foundation

class TGTripItem: NSObject {
    
    /* properties */
    var tripID: String?
    var tripName: String?
    var owner: String?
    var departureDate: NSDate?
    var retunDate: NSDate?
    var lastEditTime: NSDate?
    var createTime: NSDate?
    var daysCount: Int? {
        if departureDate != nil && retunDate != nil {
            let dc = departureDate?.coverDaysToDate(retunDate)
            return dc >= 0 ? dc : nil
        }
        return nil
    }
    
    var colManager: TGTripCollectionManager
    
    
    /* init methods */
    override init() {
        self.colManager = TGTripCollectionManager()
    }
    
    /*
    init(tripID tID: String?, tripName tName: String?, owner whom: String?, departureDate dDate: NSDate?, returnDate rDate: NSDate?, createTime cTime: NSDate?, lastEditTime leTime: NSDate?) {
        self.tripID = tID!
        self.tripName = tName
        self.owner = whom
        self.departureDate = dDate
        self.retunDate = rDate
        self.createTime = cTime
        self.lastEditTime = leTime
    }
    */

}
