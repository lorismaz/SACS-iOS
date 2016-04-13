//
//  LPCFareInfoResponse.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import Foundation
import ObjectMapper

class LPCFareInfo: NSObject, Mappable {
    var lowestFare: LPCFare?
    var lowestNonStopFare: LPCFare?
    var currencyCode: String?
    var departureDateTime: String?
    var returnDateTime: String?
    var links: [LPCLink]?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        lowestFare <- map["LowestFare"]
        lowestNonStopFare <- map["LowestNonStopFare"]
        currencyCode <- map["CurrencyCode"]
        departureDateTime <- map["DepartureDateTime"]
        returnDateTime <- map["ReturnDateTime"]
        links <- map["Links"]
    }
}
