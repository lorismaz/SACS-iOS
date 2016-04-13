//
//  LeadPriceCalendarResponse.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class LeadPriceCalendarResponse: Mappable {
    var originLocation: String?
    var destinationLocation: String?
    var fareInfos: [LPCFareInfo]?
    var links: [LPCLink]?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        originLocation <- map["OriginLocation"]
        destinationLocation <- map["DestinationLocation"]
        fareInfos <- map["FareInfo"]
        links <- map["Links"]
    }
}
