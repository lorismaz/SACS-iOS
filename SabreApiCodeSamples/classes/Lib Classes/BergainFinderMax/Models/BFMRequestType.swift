//
//  RequestType.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMRequestType: AdditionalPropertiesModel, Mappable {
    var name: String?
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        name <- map["Name"]
    }
}
