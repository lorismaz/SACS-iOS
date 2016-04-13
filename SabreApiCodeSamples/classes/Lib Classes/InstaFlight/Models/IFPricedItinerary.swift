//
//  IFPricedItinerary.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFPricedItinerary: AdditionalPropertiesModel, Mappable {
    var airItinerary: IFAirItinerary?
    var tpa_extensions: IFTPA_Extensions?
    var sequenceNumber: Int?
    var airItineraryPricingInfo: IFAirItineraryPricingInfo?
    var ticketingInfo: IFTicketingInfo?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        airItinerary <- map["AirItinerary"]
        tpa_extensions <- map["TPA_Extensions"]
        sequenceNumber <- map["SequenceNumber"]
        airItineraryPricingInfo <- map["AirItineraryPricingInfo"]
        ticketingInfo <- map["TicketingInfo"]
    }
}
