//
//  BFMOTA_AirLowFareSearchRQ.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMOTA_AirLowFareSearchRQ: AdditionalPropertiesModel, Mappable {
    var originDestinationInformations: [BFMOriginDestinationInformation]?
    var pos: BFMPOS?
    var tpaExtensions: BFMTPA_Extensions?
    var travelerInfoSummary: BFMTravelerInfoSummary?
    var travelPreferences: BFMTravelPreferences?
    
    init(originDestinationInformations: [BFMOriginDestinationInformation], pos: BFMPOS, travelerInfoSummary: BFMTravelerInfoSummary) {
        self.originDestinationInformations = originDestinationInformations
        self.pos = pos
        self.travelerInfoSummary = travelerInfoSummary
        super.init()
    }
    
    func withTPAExtensions(tpaExtensions: BFMTPA_Extensions) -> BFMOTA_AirLowFareSearchRQ {
        self.tpaExtensions = tpaExtensions
        return self
    }
    
    func withTravelPreferences(travelPreferences: BFMTravelPreferences) -> BFMOTA_AirLowFareSearchRQ {
        self.travelPreferences = travelPreferences
        return self
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        originDestinationInformations <- map["OriginDestinationInformation"]
        pos <- map["POS"]
        tpaExtensions <- map["TPA_Extensions"]
        travelerInfoSummary <- map["TravelerInfoSummary"]
        travelPreferences <- map["TravelPreferences"]
    }
}
