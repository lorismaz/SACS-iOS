//
//  BFMTravelPreferences.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 20.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMTravelPreferences: Mappable {
    var cabinPref: [BFMCabin]?
    
    init(cabinPreferences: [BFMCabin]) {
        self.cabinPref =  cabinPreferences
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        cabinPref <- map["CabinPref"]
    }
}
