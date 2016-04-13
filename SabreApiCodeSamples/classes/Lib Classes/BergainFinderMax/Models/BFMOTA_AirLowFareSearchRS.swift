//
//  OTA_AirLowFareSearchRS.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMOTA_AirLowFareSearchRS: Mappable {
    var pricedItineraries: [BFMPricedItinerary]?
    var pricedItinCount: Int?
    var brandedOneWayItinCount: Int?
    var simpleOneWayItinCount: Int?
    var departedItinCount: Int?
    var soldOutItinCount: Int?
    var availableItinCount: Int?
    var version: String?
    var warnings: [BFMWarning]?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        pricedItineraries <- map["PricedItineraries.PricedItinerary"]
        pricedItinCount <- map["PricedItinCount"]
        brandedOneWayItinCount <- map["BrandedOneWayItinCount"]
        simpleOneWayItinCount <- map["SimpleOneWayItinCount"]
        departedItinCount <- map["DepartedItinCount"]
        soldOutItinCount <- map["SoldOutItinCount"]
        availableItinCount <- map["AvailableItinCount"]
        version <- map["Version"]
        warnings <- map["Warnings.Warning"]
    }
}
