//
//  BFMOnTimePerformance.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 11.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMOnTimePerformance: Mappable {
    var level: String?
    var percentage: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        level <- map["Level"]
        percentage <- map["Percentage"]
    }
}
