//
//  IFOperatingAirline.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFOperatingAirline: AdditionalPropertiesModel, Mappable {
    var flightNumber: Int?
    var code: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        flightNumber <- map["FlightNumber"]
        code <- map["Code"]
    }
}
