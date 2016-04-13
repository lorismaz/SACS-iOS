//
//  BFMFareCalcLine.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 12.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMFareCalcLine: Mappable {
    var info: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        info <- map["Info"]
    }
}
