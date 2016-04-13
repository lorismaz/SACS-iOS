//
//  BFMPTC_FareBreakdown.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMPTC_FareBreakdown: AdditionalPropertiesModel, Mappable {
    var fareBasisCodes: BFMFareBasisCodes?
    var passengerTypeQuantity: BFMPassengerTypeQuantity?
    var passengerFare: BFMPassengerFare?
    var endorsements: BFMEndorsements?
    var fareInfos: BFMFareInfos?
    var tpa_extensions: BFMTPA_Extensions?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        fareBasisCodes <- map["FareBasisCodes"]
        passengerTypeQuantity <- map["PassengerTypeQuantity"]
        passengerFare <- map["PassengerFare"]
        endorsements <- map["Endorsements"]
        fareInfos <- map["FareInfos"]
        tpa_extensions <- map["TPA_Extensions"]
    }
}
