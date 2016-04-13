//
//  BFMAirItinerary.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMAirItinerary: AdditionalPropertiesModel, Mappable {
    var originDestinationOptions: BFMOriginDestinationOptions?
    var directionInd: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        originDestinationOptions <- map["OriginDestinationOptions"]
        directionInd <- map["DirectionInd"]
    }
}
