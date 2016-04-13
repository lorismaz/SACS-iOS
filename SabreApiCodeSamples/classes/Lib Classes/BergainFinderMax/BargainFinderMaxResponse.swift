//
//  BargainFinderMaxResponse.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BargainFinderMaxResponse: Mappable {
    var ota_AirLowFareSearchRS: BFMOTA_AirLowFareSearchRS?
    var links: [BFMLink]?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        ota_AirLowFareSearchRS <- map["OTA_AirLowFareSearchRS"]
        links <- map["Links"]
    }
}
