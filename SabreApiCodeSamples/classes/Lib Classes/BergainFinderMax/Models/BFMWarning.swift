//
//  BFMWarning.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 12.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMWarning: Mappable {
    var type: String?
    var shortText: String?
    var code: String?
    var messageClass: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        type <- map["Type"]
        shortText <- map["ShortText"]
        code <- map["Code"]
        messageClass <- map["MessageClass"]
    }
}
