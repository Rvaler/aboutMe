//
//  RVUserInfo.swift
//  RafaelValer
//
//  Created by Rafael Valer on 4/20/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import Foundation

class RVUserInfo {

    var info:Dictionary<String, AnyObject>?
    
    
    init() {
        if let path = NSBundle.mainBundle().pathForResource("UserInfo", ofType: "plist") {
            if let info = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> {
                //print(NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject>);
                self.info = info
                // use swift dictionary as normal
            }
        }
    }
}