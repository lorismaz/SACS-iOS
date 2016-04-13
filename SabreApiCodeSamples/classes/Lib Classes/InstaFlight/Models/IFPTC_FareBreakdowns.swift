//
//  IFPTC_FareBreakdowns.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFPTC_FareBreakdowns: AdditionalPropertiesModel, Mappable {
    var ptc_FareBreakdown: IFPTC_FareBreakdown?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        ptc_FareBreakdown <- map["PTC_FareBreakdown"]
    }
}
