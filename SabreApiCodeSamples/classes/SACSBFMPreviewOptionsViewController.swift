//
//  SACSBFMPreviewOptionsViewController.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 27.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import UIKit

class SACSBFMPreviewOptionsViewController: SACSPreviewOptionsViewController, UITableViewDataSource {
    
    var pricedItineraries: [BFMPricedItinerary]?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pricedItineraries?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BFMPricedItineraryCellIdentifier") as! SACSBFMPricedItineraryCell
        cell.usePricedItinerary(pricedItineraries![indexPath.row])
        return cell
    }
    
}

class SACSBFMPricedItineraryCell: UITableViewCell {
    
    func usePricedItinerary(pricedItinerary: BFMPricedItinerary) {
        departureAirportLabel.text = pricedItinerary.airItinerary?.originDestinationOptions?.originDestinationOptions?[0].flightSegments?[0].departureAirport?.locationCode
        arrivalAirportLabel.text = pricedItinerary.airItinerary?.originDestinationOptions?.originDestinationOptions?[0].flightSegments?[0].arrivalAirport?.locationCode
        directionInd.text = pricedItinerary.airItinerary?.directionInd
        sequenceNumberLabel.text = String(pricedItinerary.sequenceNumber ?? 0)
        totalFareLabel.text = String(pricedItinerary.airItineraryPricingInfo?[0].itinTotalFare?.totalFare?.amount ?? 0)
    }
    
    @IBOutlet weak var departureAirportLabel: UILabel!
    @IBOutlet weak var arrivalAirportLabel: UILabel!
    @IBOutlet weak var directionInd: UILabel!
    @IBOutlet weak var sequenceNumberLabel: UILabel!
    @IBOutlet weak var totalFareLabel: UILabel!
}
