//
//  IFFlightSegment.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFFlightSegment: AdditionalPropertiesModel, Mappable {
    var departureAirport: IFDepartureAirport?
    var arrivalAirport: IFArrivalAirport?
    var marketingAirline: IFMarketingAirline?
    var arrivalTimeZone: IFArrivalTimeZone?
    var tpa_Extensions: IFTPA_Extensions?
    var stopQuantity: Int?
    var elapsedTime: Int?
    var resBookDesigCode: String?
    var marriageGRP: String?
    var equipment: IFEquipment?
    var departureDateTime: String?
    var arrivalDateTime: String?
    var flightNumber: Int?
    var onTimePerformance: IFOnTimePerformance?
    var operatingAirline: IFOperatingAirline?
    var departureTimeZone: IFDepartureTimeZone?
    
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
        equipment <- map["Equipment"]
        departureDateTime <- map["DepartureDateTime"]
        arrivalDateTime <- map["ArrivalDateTime"]
        flightNumber <- map["FlightNumber"]
        onTimePerformance <- map["OnTimePerformance"]
        operatingAirline <- map["OperatingAirline"]
        departureTimeZone <- map["DepartureTimeZone"]
    }
}
