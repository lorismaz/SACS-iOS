//
//  TravelerInfoSummary.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMTravelerInfoSummary: AdditionalPropertiesModel, Mappable {
    var airTravelerAvails: [BFMAirTravelerAvail]?
    
    init(airTravelerAvails: [BFMAirTravelerAvail]) {
        self.airTravelerAvails = airTravelerAvails
        super.init()
    }

    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        airTravelerAvails <- map["AirTravelerAvail"]
    }
}
