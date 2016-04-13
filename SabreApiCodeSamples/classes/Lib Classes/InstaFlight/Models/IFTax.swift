//
//  IFTax.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import ObjectMapper

class IFTax: AdditionalPropertiesModel, Mappable {
    var currencyCode: String?
    var decimalPlaces: Int?
    var taxCode: String?
    var amount: Double?
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        currencyCode <- map["CurrencyCode"]
        decimalPlaces <- map["DecimalPlaces"]
        taxCode <- map["TaxCode"]
        amount <- (map["Amount"], StringOrDoubleToDoubleTransform())
    }
}

class StringOrDoubleToDoubleTransform: TransformType {
    
    typealias Object = Double
    typealias JSON = String
    
    func transformFromJSON(value: AnyObject?) -> Double? {
        if let doubleValue = value as? Double { return doubleValue }
        else if let stringValue = value as? String { return Double(stringValue) }
        else { return nil }
    }
    
    func transformToJSON(value: Double?) -> String? {
        if let doubleValue = value { return String(doubleValue) }
        else { return nil }
    }
}
