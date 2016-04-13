//
//  SACSIFFormViewController.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 15.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import UIKit

class SACSIFFormViewController: SACSExampleRequestSendingController, UITextFieldDelegate {

    let instaFlightRestCaller = SACSGenericRestGetCaller<InstaFlightRequest, InstaFlightResponse>(relativeURL: "/v2/shop/flights")
    var instaFlightResponse: InstaFlightResponse?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadIndicator.stopAnimating()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, scrollView.bounds.size.height*1.3)
    }
    
    func doExampleInstaFlightRequest() {
        if let
            origin = textFieldOrigin.text,
            destination = textFieldDestination.text,
            departureDate = textFieldDepartureDate.text,
            returnDate = textFieldReturnDate.text,
            pointOfSalesCountry = textFieldPointOfSalesCountry.text
        {
            prepareForDownload()
            instaFlightRestCaller.request = InstaFlightRequest(origin: origin, destination: destination, pointOfSaleCountry: pointOfSalesCountry).withDepartureDate(departureDate).withReturnDate(returnDate)
            instaFlightRestCaller.doCall { (request, response, json) -> () in
                self.instaFlightResponse = response
                
                self.request = request
                self.JSON = json
                self.setUIDownloaded()
                self.performSegueWithIdentifier("IFshowPreviewOptions", sender: self)
            }
        }
    }
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        doExampleInstaFlightRequest()
        resignFirstResponderFromAll()
    }
    
    private func resignFirstResponderFromAll() {
        textFieldOrigin.resignFirstResponder()
        textFieldPointOfSalesCountry.resignFirstResponder()
        textFieldDepartureDate.resignFirstResponder()
        textFieldReturnDate.resignFirstResponder()
        textFieldDestination.resignFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? SACSIFPreviewOptionsViewController {
            destinationViewController.pricedItineraries = self.instaFlightResponse?.pricedItineraries
        }
        super.prepareForSegue(segue, sender: sender)
    }
    
    // MARK: -
    // MARK: UITextFieldDelegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textFieldOrigin: UITextField!
    @IBOutlet weak var textFieldDepartureDate: UITextField!
    @IBOutlet weak var textFieldReturnDate: UITextField!
    @IBOutlet weak var textFieldDestination: UITextField!
    @IBOutlet weak var textFieldPointOfSalesCountry: UITextField!
}
