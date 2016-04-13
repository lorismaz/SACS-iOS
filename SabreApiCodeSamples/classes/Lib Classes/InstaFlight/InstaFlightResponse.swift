//
//  IFInstaFlightResponse.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class InstaFlightResponse: AdditionalPropertiesModel, Mappable {
    var pricedItineraries = [IFPricedItinerary]()
    var returnDateTime: String?
    var departureDateTime: String?
    var destinationLocation: String?
    var originLocation: String?
    var links = [IFLink]()
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        pricedItineraries <- map["PricedItineraries"]
        returnDateTime <- map["ReturnDateTime"]
        departureDateTime <- map["DepartureDateTime"]
        destinationLocation <- map["DestinationLocation"]
        originLocation <- map["OriginLocation"]
        links <- map["Links"]
    }
}
