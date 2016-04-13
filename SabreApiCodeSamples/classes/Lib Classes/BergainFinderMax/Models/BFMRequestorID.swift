//
//  RequestorID.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class BFMRequestorID: AdditionalPropertiesModel, Mappable {
    var companyName: BFMCompanyName?
    var ID: String?
    var type: String?
    
    init(companyName: BFMCompanyName, ID: String, type: String) {
        self.companyName = companyName
        self.ID = ID
        self.type = type
        super.init()
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        companyName <- map["CompanyName"]
        ID <- map["ID"]
        type <- map["Type"]
    }
}
