//
//  BFMCabin.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMCabin: AdditionalPropertiesModel, Mappable {
    var cabin: String?
    
    init(cabin: String) {
        self.cabin = cabin
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        cabin <- map["Cabin"]
    }
}
