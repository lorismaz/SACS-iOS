//
//  LPCFareResponse.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class LPCFare: Mappable {
    var airlineCodes: [String]?
    var fare: Double?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        airlineCodes <- map["AirlineCodes"]
        fare <- map["Fare"]
    }
    
}
