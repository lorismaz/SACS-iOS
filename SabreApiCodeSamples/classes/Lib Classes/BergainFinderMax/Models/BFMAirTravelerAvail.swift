//
//  AirTravelerAvail.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMAirTravelerAvail: AdditionalPropertiesModel, Mappable {
    var passengerTypeQuantities: [BFMPassengerTypeQuantity]?
    
    init(passengerTypeQuantities: [BFMPassengerTypeQuantity]) {
        self.passengerTypeQuantities = passengerTypeQuantities
        super.init()
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        passengerTypeQuantities <- map["PassengerTypeQuantity"]
    }

}
