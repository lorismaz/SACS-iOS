//
//  BargainFinderMaxRequest.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BargainFinderMaxRequest: AdditionalPropertiesModel, Mappable {
    var ota_AirLowFareSearchRQ: BFMOTA_AirLowFareSearchRQ?
    
    init(ota_AirLowFareSearchRQ: BFMOTA_AirLowFareSearchRQ) {
        self.ota_AirLowFareSearchRQ = ota_AirLowFareSearchRQ
        super.init()
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        ota_AirLowFareSearchRQ <- map["OTA_AirLowFareSearchRQ"]
    }
}
