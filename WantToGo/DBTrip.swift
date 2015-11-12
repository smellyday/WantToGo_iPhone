//
//  DBTrip.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/12.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import Foundation
import SwiftyJSON

class DBTrip: NSObject {
    
    /* properties */
    var tripID: String?
    var tripName: String?
    var owner: String?
    var departureDate: NSDate?
    var retunDate: NSDate?
    var lastEditTime: NSDate?
    var createTime: NSDate?
    var collectionItems: [GeoIDColItem]?
    
    
    init(JSONTripData jsonTrip: AnyObject) {
        let trip_id = jsonTrip["id"] as! String
        let trip_name = jsonTrip["name"] as! String
        let trip_owner = jsonTrip["owner"] as! String
        let trip_departure = jsonTrip["departure_date"] as? Double
        let trip_return = jsonTrip["return_date"] as? Double
        let trip_create = jsonTrip["create_time"] as? Double
        let trip_edit = jsonTrip["edit_time"] as? Double
        
        tripID = trip_id
        tripName = trip_name
        owner = trip_owner
        departureDate = trip_departure != nil ? NSDate(timeIntervalSince1970: trip_departure!) : nil
        retunDate = trip_return != nil ? NSDate(timeIntervalSince1970: trip_return!) : nil
        createTime = trip_create != nil ? NSDate(timeIntervalSince1970: trip_create!) : nil
        lastEditTime = trip_edit != nil ? NSDate(timeIntervalSince1970: trip_edit!) : nil
        
        if let tmpDic = jsonTrip["collections"] as? [String : AnyObject] {
            if let geoIDJsonArray = tmpDic["all"] as? [AnyObject] {
                collectionItems = [GeoIDColItem]()
                for itemJsonData in geoIDJsonArray {
                    let geoItem = GeoIDColItem(JSONData: itemJsonData)
                    collectionItems!.append(geoItem)
                }
            }
        }
        

    }
    
    
    
}

class GeoIDColItem: NSObject {
    var geoID: String!
    var geoIDsArray: [GeoIDColItem]?
    
    init(JSONData: AnyObject) {
        geoID = JSONData["id"] as! String
        
        let itemsJSONArray = JSONData["items"] as? [AnyObject]
        if itemsJSONArray != nil && itemsJSONArray?.count > 0 {
            geoIDsArray = [GeoIDColItem]()
            for itemJson in itemsJSONArray! {
                let geoItem = GeoIDColItem(JSONData: itemJson)
                geoIDsArray!.append(geoItem)
            }
            
        }
    }
    
}











