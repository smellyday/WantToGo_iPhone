//
//  TGTripAngine.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/9.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import Foundation

class TGTripAngine: NSObject {
    
    static let sharedTripAngine: TGTripAngine = TGTripAngine()
    var trips: [TGTripItem]?
    
    
    override init() {
        super.init()
        
        let tripsDB = YTKKeyValueStore(DBWithName: "TripsDatabase")
        tripsDB.createTableWithName("trips_table")
        tripsDB.createTableWithName("system_pois_table")
        tripsDB.createTableWithName("custom_pois_table")
        tripsDB.close()
        
        self.loadTrips()
    }
    
    
    func loadTrips() {
        
        
        
        let filePath = NSBundle.mainBundle().pathForResource("tripJson", ofType: nil)!
        let testData = NSData(contentsOfFile: filePath)
        
        do {
            
            let jsonDic = try NSJSONSerialization.JSONObjectWithData(testData!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            
            let poisDic = jsonDic[JSON_KEY_SYSTEM_POIS]
            let customPoisDic = jsonDic[JSON_KEY_CUSTOM_POIS]
            let tripInfoDic = [
                JSON_KEY_TRIP_ID : jsonDic[JSON_KEY_TRIP_ID],
                JSON_KEY_TRIP_NAME : jsonDic[JSON_KEY_TRIP_NAME],
                JSON_KEY_TRIP_CREATE_TIME : jsonDic[JSON_KEY_TRIP_CREATE_TIME],
                JSON_KEY_TRIP_EDIT_TIME : jsonDic[JSON_KEY_TRIP_EDIT_TIME],
                JSON_KEY_TRIP_DEPARTURE_DATE : jsonDic[JSON_KEY_TRIP_DEPARTURE_DATE],
                JSON_KEY_TRIP_RETURN_DATE : jsonDic[JSON_KEY_TRIP_RETURN_DATE],
                JSON_KEY_TRIP_DAYS_COUNT : jsonDic[JSON_KEY_TRIP_DAYS_COUNT],
                JSON_KEY_TRIP_OWNER : jsonDic[JSON_KEY_TRIP_OWNER],
                JSON_KEY_TRIP_COLLECTIONS : jsonDic[JSON_KEY_TRIP_COLLECTIONS]
            ]

        } catch let error as NSError {
            print(error)
        }
        
        
        
    }
    
    
    
    
    
}
