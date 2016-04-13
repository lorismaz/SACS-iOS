//
//  AdditionalPropertiesModel.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 28.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

class AdditionalPropertiesModel {
    var additionalProperties = [String:AnyObject]()
    
    func withAdditionalProperty(key: String, value: AnyObject) -> AdditionalPropertiesModel {
        additionalProperties[key] = value
        return self
    }
}
