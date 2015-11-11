//
//  TGGeoNode.swift
//  WantToGo
//
//  Created by zhangpan on 15/11/11.
//  Copyright © 2015年 wanttogo. All rights reserved.
//

import Foundation

class TGGeoNode: NSObject {
    var geoID:      String?
    var geoPID:     String?
    var geoType:    UInt?
    var geoLevel:   (placeLevel: UInt, regionLevel: UInt?)?
    var geoPos:     (latitude: Double, longitude: Double)?
    var visible:    Bool?
}
