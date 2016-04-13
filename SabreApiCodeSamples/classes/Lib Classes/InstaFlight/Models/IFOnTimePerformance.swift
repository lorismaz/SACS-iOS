//
//  IFOnTimePerformance.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 11.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFOnTimePerformance: Mappable {
    var level: Int?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        level <- map["Level"]
    }
}
