//
//  LPCLink.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class LPCLink: Mappable  {
    var rel: String?
    var href: String?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        rel <- map["rel"]
        href <- map["href"]
    }
}
