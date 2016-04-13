//
//  IFOriginDestinationOption.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFOriginDestinationOption: AdditionalPropertiesModel, Mappable {
    var flightSegments: [IFFlightSegment]?
    var elapsedTime: Int?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        flightSegments <- map["FlightSegment"]
        elapsedTime <- map["ElapsedTime"]
    }
}
