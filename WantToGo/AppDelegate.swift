//
//  AppDelegate.swift
//  WantToGo
//
//  Created by zhangpan on 15/10/29.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit


let Home_NavigationController: UINavigationController! = UIApplication.sharedApplication().keyWindow?.rootViewController as! UINavigationController
var sharedTripAngine: TGTripAngine?


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        sharedTripAngine = TGTripAngine()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    private func prepareDatabase() {
        let filePath = NSBundle.mainBundle().pathForResource("tripJson", ofType: nil)!
        let testData = NSData(contentsOfFile: filePath)
        
        do {
            let jsonDic = try NSJSONSerialization.JSONObjectWithData(testData!, options: NSJSONReadingOptions.AllowFragments) as! [String : AnyObject?]
            let tripsArr = [jsonDic, jsonDic, jsonDic]
            
            
            
            
            // open db.
            let tripsDB = YTKKeyValueStore(DBWithName: "TripsDatabase")
            
            
            // create table.
            tripsDB.createTableWithName("trips_table")
            tripsDB.createTableWithName("system_pois_table")
            tripsDB.createTableWithName("custom_pois_table")
            
            
            // update db.
            for tripDic in tripsArr {
                
//                let poisDic = tripDic[JSON_KEY_SYSTEM_POIS]
//                let customPoisDic = tripDic[JSON_KEY_CUSTOM_POIS]
                
                if let tripDataDic = tripDic[JSON_KEY_TRIP_DATA] as? [String : AnyObject?] {
                    
                    let tripID = tripDataDic[JSON_KEY_TRIP_ID] as! String
                    
                    let tripInfoDic: [String : AnyObject?] = [
                        JSON_KEY_TRIP_NAME : tripDataDic[JSON_KEY_TRIP_NAME] as! String?,
                        JSON_KEY_TRIP_CREATE_TIME : tripDataDic[JSON_KEY_TRIP_CREATE_TIME] as! String?,
                        JSON_KEY_TRIP_EDIT_TIME : tripDataDic[JSON_KEY_TRIP_EDIT_TIME] as! String?,
                        JSON_KEY_TRIP_DEPARTURE_DATE : tripDataDic[JSON_KEY_TRIP_DEPARTURE_DATE] as! String?,
                        JSON_KEY_TRIP_RETURN_DATE : tripDataDic[JSON_KEY_TRIP_RETURN_DATE] as! String?,
                        JSON_KEY_TRIP_DAYS_COUNT : tripDataDic[JSON_KEY_TRIP_DAYS_COUNT] as! UInt?,
                        JSON_KEY_TRIP_OWNER : tripDataDic[JSON_KEY_TRIP_OWNER] as! String?,
                        JSON_KEY_TRIP_COLLECTIONS : tripDataDic[JSON_KEY_TRIP_COLLECTIONS] as! Array<AnyObject>?
                    ]
                    
                    tripsDB.putObject(tripInfoDic, withId: tripID, intoTable: "trips_table")
                    
                }
                
            }
            
            
            // close db.
            tripsDB.close()
            
            
        } catch let error as NSError {
            print(error)
        }
        
    }
    
    
    
    
    
    
    
    

}

