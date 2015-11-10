//
//  AppDelegate.swift
//  WantToGo
//
//  Created by zhangpan on 15/10/29.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import UIKit


let Home_NavigationController: UINavigationController! = UIApplication.sharedApplication().keyWindow?.rootViewController as! UINavigationController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tripdb: FMDatabase!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        /* open trip database */
        let sysDocuments = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        let tripDatabaseFileUrl = sysDocuments.URLByAppendingPathComponent("TripDatabase")

        tripdb = FMDatabase(path: tripDatabaseFileUrl.path)
        if !tripdb.open() {
            print("Trip Database open error!")
            return true
        }
        
        var success: Bool
        success = tripdb.executeUpdate("create table TripsTable(trip_id varchar(100), trip_name varchar(255))", withArgumentsInArray: nil)
        if !success {
            print("create table error")
        }
        
        success = tripdb.executeUpdate("insert into TripsTable values(\"1234567\", \"trip001\")", withArgumentsInArray: [""])
        if !success {
            print("insert error")
        }
        success = tripdb.executeUpdate("insert into TripsTable values(?, ?)", ["768553", "trip002"])
        if !success {
            print("insert error")
        }
        
        let ret = tripdb.executeQuery("select * from TripsTable", withArgumentsInArray: nil)
        while ret.next() {
            let tid = ret.stringForColumn("trip_id")
            let tname = ret.stringForColumn("trip_name")
            print("Trip id : \(tid), name : \(tname)")
        }
        
        tripdb.close()
        
        
//        tripDBQueue = FMDatabaseQueue(path: tripDatabaseFileUrl.path)
//        assert(tripDBQueue != nil, "Trip Database Init Error")
        
//        tripDBQueue!.inDatabase(){
//            (database: FMDatabase!) in
//
//        }

        
        
        
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


}

