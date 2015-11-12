//
//  TGTripAngine.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/9.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

class TGTripAngine {
    
    static let sharedTripAngine: TGTripAngine = TGTripAngine()
    var trips: [TGTripItem]?
    
    
    func loadTrips() {
        
        // open db.
        let tripsDB = YTKKeyValueStore(DBWithName: "TripsDatabase")
        tripsDB.createTableWithName("trips_table")
        tripsDB.createTableWithName("system_pois_table")
        tripsDB.createTableWithName("custom_pois_table")
        
        // query from db.
        if let dbTripsArray = tripsDB.getAllItemsFromTable("trips_table") {
            var n = 1
            for dbTrip in dbTripsArray {
                print("the \(n) trip : \(dbTrip)")
                n++
            }
        }
        
        // close db.
        tripsDB.close()
    }
    
    
    
    
    
}
