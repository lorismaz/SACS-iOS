//
//  IFPassengerFare.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFPassengerFare: AdditionalPropertiesModel, Mappable {
    var fareConstruction: IFFareConstruction?
    var totalFare: IFTotalFare?
    var taxes: IFTaxes?
    var baseFare: IFBaseFare?
    var equivFare: IFEquivFare?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        fareConstruction <- map["FareConstruction"]
        totalFare <- map["TotalFare"]
        taxes <- map["Taxes"]
        baseFare <- map["BaseFare"]
        equivFare <- map["EquivFare"]
    }
}
