//
//  IFAirItineraryPricingInfo.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFAirItineraryPricingInfo: AdditionalPropertiesModel, Mappable {
    var ptc_FareBreakdowns: IFPTC_FareBreakdowns?
    var fareInfos: IFFareInfos?
    var tpaExtensions: IFTPA_Extensions?
    var itinTotalFare: IFItinTotalFare?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        ptc_FareBreakdowns <- map["PTC_FareBreakdowns"]
        fareInfos <- map["FareInfos"]
        tpaExtensions <- map["TPA_Extensions"]
        itinTotalFare <- map["ItinTotalFare"]
    }
}
