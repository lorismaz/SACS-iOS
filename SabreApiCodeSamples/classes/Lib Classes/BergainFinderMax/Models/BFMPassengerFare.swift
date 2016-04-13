//
//  BFMPassengerFare.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMPassengerFare: AdditionalPropertiesModel, Mappable {
    var fareConstruction: BFMFareConstruction?
    var totalFare: BFMTotalFare?
    var taxes: BFMTaxes?
    var baseFare: BFMBaseFare?
    var equivFare: BFMEquivFare?
    var tpa_Extensions: BFMTPA_Extensions?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        fareConstruction <- map["FareConstruction"]
        totalFare <- map["TotalFare"]
        taxes <- map["Taxes"]
        baseFare <- map["BaseFare"]
        equivFare <- map["EquivFare"]
        tpa_Extensions <- map["TPA_Extensions"]
    }
}
