//
//  OriginLocation.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMOriginLocation: AdditionalPropertiesModel, Mappable {
    var locationCode: String?
    
    init(locationCode: String) {
        self.locationCode = locationCode
        super.init()
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        locationCode <- map["LocationCode"]
    }
}
