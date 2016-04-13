//
//  POS.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMPOS: AdditionalPropertiesModel, Mappable {
    var sources: [BFMSource]?
    
    init(sources: [BFMSource]) {
        self.sources = sources
        super.init()
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        sources <- map["Source"]
    }
}
