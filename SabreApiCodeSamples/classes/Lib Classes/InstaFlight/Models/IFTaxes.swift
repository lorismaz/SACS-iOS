//
//  IFTaxes.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFTaxes: AdditionalPropertiesModel, Mappable {
    var totalTax: IFTotalTax?
    var taxes: [IFTax]?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        totalTax <- map["TotalTax"]
        taxes <- map["Tax"]
    }
}
