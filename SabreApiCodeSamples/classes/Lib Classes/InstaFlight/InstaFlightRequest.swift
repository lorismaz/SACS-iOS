//
//  InstaFlightRequest.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 15.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

class InstaFlightRequest: SACSBaseGetRequest {
    var origin: String
    var destination: String
    var departureDate: String?
    var returnDate: String?
    var pointOfSaleCountry: String?
    
    init(origin: String, destination: String, pointOfSaleCountry: String) {
        self.origin = origin
        self.destination = destination
        self.pointOfSaleCountry = pointOfSaleCountry
    }
    
    func withDepartureDate(departureDate: String) -> InstaFlightRequest {
        self.departureDate = departureDate
        return self
    }
    
    func withReturnDate(returnDate: String) -> InstaFlightRequest {
        self.returnDate = returnDate
        return self
    }
}
