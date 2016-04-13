//
//  Source.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMSource: AdditionalPropertiesModel, Mappable {
    var requestorID: BFMRequestorID?
    
    init(requestorID: BFMRequestorID) {
        self.requestorID = requestorID
        super.init()
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        requestorID <- map["RequestorID"]
    }
}
