//
//  BFMValidatingCarrier.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMValidatingCarrier: AdditionalPropertiesModel, Mappable {
    var code: String?
    var settlementMethod: String?
    var newVCXProcess: Bool?
    var defaultValue: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        code <- map["Code"]
        settlementMethod <- map["SettlementMethod"]
        newVCXProcess <- map["NewVcxProcess"]
        defaultValue <- map["Default"]
    }
}
