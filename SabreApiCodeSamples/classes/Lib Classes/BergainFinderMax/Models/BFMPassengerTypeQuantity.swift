//
//  BFMPassengerTypeQuantity.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMPassengerTypeQuantity: AdditionalPropertiesModel, Mappable {
    var quantity: Int?
    var code: String?
    
    init(quantity: Int, code: String) {
        self.quantity = quantity
        self.code = code
        super.init()
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        quantity <- map["Quantity"]
        code <- map["Code"]
    }
}
