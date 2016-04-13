//
//  IFAirItinerary.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFAirItinerary: AdditionalPropertiesModel, Mappable {
    var originDestinationOptions: IFOriginDestinationOptions?
    var directionInd: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        originDestinationOptions <- map["OriginDestinationOptions"]
        directionInd <- map["DirectionInd"]
    }
}
