//
//  IntelliSellTransaction.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMIntelliSellTransaction: AdditionalPropertiesModel, Mappable {
    var requestType: BFMRequestType?
    
    init(requestType: BFMRequestType) {
        self.requestType = requestType
        super.init()
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        requestType <- map["RequestType"]
    }
    
}
