//
//  BFMFareBasisCode.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMFareBasisCode: AdditionalPropertiesModel, Mappable {
    var bookingCode: String?
    var departureAirportCode: String?
    var arrivalAirportCode: String?
    var content: String?
    var availabilityBreak: Bool?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        bookingCode <- map["BookingCode"]
        departureAirportCode <- map["DepartureAirportCode"]
        arrivalAirportCode <- map["ArrivalAirportCode"]
        content <- map["content"]
        availabilityBreak <- map["AvailabilityBreak"]
    }
}
