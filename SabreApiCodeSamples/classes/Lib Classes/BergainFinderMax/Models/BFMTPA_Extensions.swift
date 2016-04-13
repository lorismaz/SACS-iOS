//
//  TPAExtensions.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMTPA_Extensions: AdditionalPropertiesModel, Mappable {
    var eTicket: BFMETicket?
    var validatingCarrier: BFMValidatingCarrier?
    var cabin: BFMCabin?
    var seatsRemaining: BFMSeatsRemaining?
    var divideInParty: BFMDivideInParty?
    var intelliSellTransaction: BFMIntelliSellTransaction?
    var messages: [BFMMessage]?
    var baggageInformations: [BFMBaggageInformation]?
    var fareCalcLine: BFMFareCalcLine?
    
    override init() { super.init() }
    
    func withIntelliSellTransaction(intelliSellTransaction: BFMIntelliSellTransaction) -> BFMTPA_Extensions {
        self.intelliSellTransaction = intelliSellTransaction
        return self
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        eTicket <- map["eTicket"]
        validatingCarrier <- map["ValidatingCarrier"]
        cabin <- map["Cabin"]
        seatsRemaining <- map["SeatsRemaining"]
        divideInParty <- map["DivideInParty"]
        intelliSellTransaction <- map["IntelliSellTransaction"]
        messages <- map["Messages.Message"]
        baggageInformations <- map["BaggageInformationList.BaggageInformation"]
        fareCalcLine <- map["FareCalcLine"]
    }
}
