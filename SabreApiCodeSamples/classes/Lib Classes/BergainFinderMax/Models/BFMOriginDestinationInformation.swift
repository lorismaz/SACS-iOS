//
//  OriginDestinationInformation.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMOriginDestinationInformation: AdditionalPropertiesModel, Mappable {
    var departureDateTime: String?
    var destinationLocation: BFMDestinationLocation?
    var originLocation: BFMOriginLocation?
    var RPH: String?
    
    init(departureDateTime: String, originLocation: BFMOriginLocation, destinationLocation: BFMDestinationLocation) {
        self.departureDateTime = departureDateTime
        self.originLocation = originLocation
        self.destinationLocation = destinationLocation
        super.init()
    }
    
    func withRPH(RPH: String) -> BFMOriginDestinationInformation {
        self.RPH = RPH
        return self
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        departureDateTime <- map["DepartureDateTime"]
        destinationLocation <- map["DestinationLocation"]
        originLocation <- map["OriginLocation"]
        RPH <- map["RPH"]
    }
}
