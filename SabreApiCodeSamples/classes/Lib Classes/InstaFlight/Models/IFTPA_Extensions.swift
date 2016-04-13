//
//  IFTPA_Extensions.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFTPA_Extensions: AdditionalPropertiesModel, Mappable {
    var eTicket: IFETicket?
    var validatingCarrier: IFValidatingCarrier?
    var cabin: IFCabin?
    var seatsRemaining: IFSeatsRemaining?
    var divideInParty: IFDivideInParty?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        eTicket <- map["eTicket"]
        validatingCarrier <- map["ValidatingCarrier"]
        cabin <- map["Cabin"]
        seatsRemaining <- map["SeatsRemaining"]
        divideInParty <- map["DivideInParty"]
    }
}
