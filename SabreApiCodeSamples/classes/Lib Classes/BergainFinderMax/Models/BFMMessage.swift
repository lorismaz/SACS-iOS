//
//  BFMMessages.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 12.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMMessage: Mappable {
    var airlineCode: String?
    var type: String?
    var failCode: Int?
    var info: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        airlineCode <- map["AirlineCode"]
        type <- map["Type"]
        failCode <- map["FailCode"]
        info <- map["Info"]
    }
}
