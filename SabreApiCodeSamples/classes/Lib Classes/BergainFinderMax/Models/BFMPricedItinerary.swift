//
//  IFPricedItinerary.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMPricedItinerary: AdditionalPropertiesModel, Mappable {
    var sequenceNumber: Int?
    var airItinerary: BFMAirItinerary?
    var tpa_extensions: BFMTPA_Extensions?
    var airItineraryPricingInfo: [BFMAirItineraryPricingInfo]?
    var ticketingInfo: BFMTicketingInfo?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        sequenceNumber <- map["SequenceNumber"]
        airItinerary <- map["AirItinerary"]
        tpa_extensions <- map["TPA_Extensions"]
        airItineraryPricingInfo <- map["AirItineraryPricingInfo"]
        ticketingInfo <- map["TicketingInfo"]
    }
}
