//
//  BFMFlightSegment.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMFlightSegment: AdditionalPropertiesModel, Mappable {
    var departureAirport: BFMDepartureAirport?
    var arrivalAirport: BFMArrivalAirport?
    var marketingAirline: BFMMarketingAirline?
    var arrivalTimeZone: BFMArrivalTimeZone?
    var tpa_Extensions: BFMTPA_Extensions?
    var stopQuantity: Int?
    var elapsedTime: Int?
    var resBookDesigCode: String?
    var marriageGRP: String?
    var equipments: [BFMEquipment]?
    var departureDateTime: String?
    var arrivalDateTime: String?
    var flightNumber: String?
    var onTimePerformance: BFMOnTimePerformance?
    var operatingAirline: BFMOperatingAirline?
    var departureTimeZone: BFMDepartureTimeZone?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        departureAirport <- map["DepartureAirport"]
        arrivalAirport <- map["ArrivalAirport"]
        marketingAirline <- map["MarketingAirline"]
        arrivalTimeZone <- map["ArrivalTimeZone"]
        tpa_Extensions <- map["TPA_Extensions"]
        stopQuantity <- map["StopQuantity"]
        elapsedTime <- map["ElapsedTime"]
        resBookDesigCode <- map["ResBookDesigCode"]
        marriageGRP <- map["MarriageGrp"]
        equipments <- map["Equipment"]
        departureDateTime <- map["DepartureDateTime"]
        arrivalDateTime <- map["ArrivalDateTime"]
        flightNumber <- map["FlightNumber"]
        onTimePerformance <- map["OnTimePerformance"]
        operatingAirline <- map["OperatingAirline"]
        departureTimeZone <- map["DepartureTimeZone"]
    }
}
