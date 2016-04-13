//
//  IFFareInfos.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFFareInfos: AdditionalPropertiesModel, Mappable {
    var fareInfos: [IFFareInfo]?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        fareInfos <- map["FareInfo"]
    }
}
