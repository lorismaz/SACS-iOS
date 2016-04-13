//
//  BFMBaggageInformation.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 12.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMBaggageInformation: Mappable {
    var segments: [BFMSegment]?
    var allowance: BFMAllowance?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        segments <- map["Segment"]
        allowance <- map["Allowance"]
    }
}

class BFMSegment: Mappable {
    var segmentId: Int?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        segmentId <- map["Id"]
    }
}

class BFMAllowance: Mappable {
    var pieces: Int?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        pieces <- map["Pieces"]
    }
}