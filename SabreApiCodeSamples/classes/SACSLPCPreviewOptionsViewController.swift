//
//  SACSPreviewOptionsViewController.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 15.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import UIKit

class SACSPreviewOptionsViewController: SACSExampleRequestSendingController {
    
    var requestString: String!
    var responseString: String?
    
    var prepareStringToPreview: String!

    @IBAction func responsePreviewTapped(sender: AnyObject) {
        prepareStringToPreview = responseString
        performSegueWithIdentifier("jsonPreview", sender: self)
    }
    
    @IBAction func requestPreviewTapped(sender: AnyObject) {
        prepareStringToPreview = requestString
        performSegueWithIdentifier("jsonPreview", sender: self) 
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "jsonPreview") {
            let destinationController = segue.destinationViewController as! SACSPreviewViewController
            destinationController.JSONToShow = prepareStringToPreview
        } else { super.prepareForSegue(segue, sender: sender) }
    }
}

class SACSLPCPreviewOptionsViewController: SACSPreviewOptionsViewController {

    var fareInfos: [LPCFareInfo]?
    let instaFlightRestCaller = SACSGenericRestGetCaller<InstaFlightRequest, InstaFlightResponse>()
    var instaFlightResponse: InstaFlightResponse?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fareInfos?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FareCellIdentifier") as! SACSFareCell
        cell.useFareInfo(fareInfos![indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let fareInfo = fareInfos?[indexPath.row], url = fareInfo.links?[0].href {
            doExampleInstaFlightRequestToURL(url)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func doExampleInstaFlightRequestToURL(url: String) {
        prepareForDownload()
        instaFlightRestCaller.absoluteURL = url
        instaFlightRestCaller.doCall { (request, response, json) -> () in
            self.instaFlightResponse = response
            self.JSON = json
            self.request = request
            self.setUIDownloaded()
            self.performSegueWithIdentifier("IFshowPreviewOptions", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? SACSIFPreviewOptionsViewController {
            destinationViewController.pricedItineraries = instaFlightResponse?.pricedItineraries
        }
        super.prepareForSegue(segue, sender: sender)
    }
    
    override func prepareForDownload() {
        downloadIndicator.startAnimating()
        tableViewWithFareInfos.userInteractionEnabled = false
    }
    
    override func setUIDownloaded() {
        downloadIndicator.stopAnimating()
        tableViewWithFareInfos.userInteractionEnabled = true
    }
    
    @IBOutlet weak var tableViewWithFareInfos: UITableView!
    
}

class SACSFareCell: UITableViewCell {
    @IBOutlet weak var departureDateTimeLabel: UILabel!
    @IBOutlet weak var returnDateTimeLabel: UILabel!
    @IBOutlet weak var currencyCodeLabel: UILabel!
    @IBOutlet weak var lowestFareLabel: UILabel!
    @IBOutlet weak var airlineCodesLabel: UILabel!
    
    func useFareInfo(fareInfo: LPCFareInfo) {
        departureDateTimeLabel.text = fareInfo.departureDateTime
        returnDateTimeLabel.text = fareInfo.returnDateTime
        currencyCodeLabel.text = fareInfo.currencyCode
        if let lowestFare = fareInfo.lowestFare?.fare, airlineCodes = fareInfo.lowestFare?.airlineCodes {
            lowestFareLabel.text = String(lowestFare)
            var airlineCodesString = ""
            for code in airlineCodes { airlineCodesString += "\(code) " }
            airlineCodesLabel.text = airlineCodesString
        }
    }
}
