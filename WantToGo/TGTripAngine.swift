//
//  TGTripAngine.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/9.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import Foundation

class TGTripAngine: NSObject {
    
    static let tripAngine: TGTripAngine = TGTripAngine()
    var trips: [TGTripItem]?
    
    override init() {
        super.init()
        self.loadTrips()
    }
    
    func loadTrips() {
        
        let filePath = NSBundle.mainBundle().pathForResource("tripJson", ofType: nil)!
        let testData = NSData(contentsOfFile: filePath)
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(testData!, options: NSJSONReadingOptions.AllowFragments)
            print(json)
        } catch let error as NSError {
            print(error)
        }
        
    }
}
