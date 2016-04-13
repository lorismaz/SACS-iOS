//
//  BFMFareInfos.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMFareInfos: AdditionalPropertiesModel, Mappable {
    var fareInfos: [BFMFareInfo]?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        fareInfos <- map["FareInfo"]
    }
}
