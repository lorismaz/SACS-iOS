//
//  IFPTC_FareBreakdown.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFPTC_FareBreakdown: AdditionalPropertiesModel, Mappable {
    var fareBasisCodes: IFFareBasisCodes?
    var passengerTypeQuantity: IFPassengerTypeQuantity?
    var passengerFare: IFPassengerFare?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        fareBasisCodes <- map["FareBasisCodes"]
        passengerTypeQuantity <- map["PassengerTypeQuantity"]
        passengerFare <- map["PassengerFare"]
    }
}
