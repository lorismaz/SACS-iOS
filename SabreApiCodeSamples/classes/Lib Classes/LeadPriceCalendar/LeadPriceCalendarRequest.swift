//
//  LeadPriceCalendarRequest.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 29.10.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

class LeadPriceCalendarRequest: SACSBaseGetRequest {
    var origin: String
    var destination: String
    var lengthOfStay: Int
    var departureDate: String?
    var minFare: String?
    var maxFare: String?
    var pointOfSaleCountry: String?
    
    init(origin: String, destination: String, lengthOfStay: Int) {
        self.origin = origin
        self.destination = destination
        self.lengthOfStay = lengthOfStay
    }
    
    func withPointOfSaleCountry(pointOfSaleCountry: String?) -> LeadPriceCalendarRequest {
        self.pointOfSaleCountry = pointOfSaleCountry
        return self
    }
    

}
