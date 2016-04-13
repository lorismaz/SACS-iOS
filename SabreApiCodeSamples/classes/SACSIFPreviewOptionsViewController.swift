//
//  SACSIFPreviewOptionsViewController.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 27.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import UIKit

class SACSIFPreviewOptionsViewController: SACSPreviewOptionsViewController, UITableViewDataSource {
    
    var pricedItineraries: [IFPricedItinerary]?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pricedItineraries?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IFPricedItineraryCellIdentifier") as! SACSIFPricedItineraryCell
        cell.usePricedItinerary(pricedItineraries![indexPath.row])
        return cell
    }
    
}

class SACSIFPricedItineraryCell: UITableViewCell {
    
    func usePricedItinerary(pricedItinerary: IFPricedItinerary) {
        departureAirportLabel.text = pricedItinerary.airItinerary?.originDestinationOptions?.originDestinationOptions?[0].flightSegments?[0].departureAirport?.locationCode
        arrivalAirportLabel.text = pricedItinerary.airItinerary?.originDestinationOptions?.originDestinationOptions?[0].flightSegments?[0].arrivalAirport?.locationCode
        flightNumberLabel.text = String(pricedItinerary.airItinerary?.originDestinationOptions?.originDestinationOptions?[0].flightSegments?[0].flightNumber ?? 0)
        sequenceNumberLabel.text = String(pricedItinerary.sequenceNumber ?? 0)
        ticketInfoLabel.text = pricedItinerary.ticketingInfo?.ticketType
    }
    
    @IBOutlet weak var departureAirportLabel: UILabel!
    @IBOutlet weak var arrivalAirportLabel: UILabel!
    @IBOutlet weak var flightNumberLabel: UILabel!
    @IBOutlet weak var sequenceNumberLabel: UILabel!
    @IBOutlet weak var ticketInfoLabel: UILabel!
}
