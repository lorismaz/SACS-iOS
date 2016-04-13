//
//  BFMSeatsRemaining.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMSeatsRemaining: AdditionalPropertiesModel, Mappable {
    var belowMin: Bool?
    var number: Int?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        belowMin <- map["BelowMin"]
        number <- map["Number"]
    }
}
