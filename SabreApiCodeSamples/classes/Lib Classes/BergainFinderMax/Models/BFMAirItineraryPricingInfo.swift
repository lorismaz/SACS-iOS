//
//  BFMAirItineraryPricingInfo.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMAirItineraryPricingInfo: AdditionalPropertiesModel, Mappable {
    var ptc_FareBreakdowns: BFMPTC_FareBreakdowns?
    var fareInfos: BFMFareInfos?
    var tpaExtensions: BFMTPA_Extensions?
    var itinTotalFare: BFMItinTotalFare?
    var lastTicketDate: String?
    var pricingSource: String?
    var pricingSubSource: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        ptc_FareBreakdowns <- map["PTC_FareBreakdowns"]
        fareInfos <- map["FareInfos"]
        tpaExtensions <- map["TPA_Extensions"]
        itinTotalFare <- map["ItinTotalFare"]
        lastTicketDate <- map["LastTicketDate"]
        pricingSource <- map["PricingSource"]
        pricingSubSource <- map["PricingSubSource"]
    }
}
