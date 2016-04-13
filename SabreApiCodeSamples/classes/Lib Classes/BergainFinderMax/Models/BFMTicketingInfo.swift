//
//  BFMTicketingInfo.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMTicketingInfo: AdditionalPropertiesModel, Mappable {
    var ticketType: String?
    var validInterline: String?
    var eTicketNumber: String?
    var ticketTimeLimit: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        ticketType <- map["TicketType"]
        validInterline <- map["ValidInterline"]
        eTicketNumber <- map["eTicketNumber"]
        ticketTimeLimit <- map["TicketTimeLimit"]
    }
}
