//
//  SACSBFMFormViewController.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 15.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import UIKit

class SACSBFMFormViewController: SACSExampleRequestSendingController, UITextFieldDelegate {

    let bfmRestCaller = SACSGenericRestPostCaller<BargainFinderMaxRequest, BargainFinderMaxResponse>(relativeURL: "/v1.9.0/shop/flights?mode=live")
    var bargainFinderMaxResponse: BargainFinderMaxResponse?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadIndicator.stopAnimating()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, scrollView.bounds.size.height*1.4)
    }
    
    func doExampleBargainFinderMaxRequest() {
        prepareForDownload()
        bfmRestCaller.request = generateBargainFinderMaxRequest()
        bfmRestCaller.doCall { (request, response, json) -> () in
            self.bargainFinderMaxResponse = response
            
            self.request = request
            self.JSON = json
            self.setUIDownloaded()
            self.performSegueWithIdentifier("BFMshowPreviewOptions", sender: self)
        }
    }
    
    private func generateBargainFinderMaxRequest() -> BargainFinderMaxRequest {
        let originDestinationInformationGo = BFMOriginDestinationInformation(departureDateTime: textFieldDepartureDate.text!, originLocation: BFMOriginLocation(locationCode: textFieldOrigin.text!), destinationLocation: BFMDestinationLocation(locationCode: textFieldDestination.text!)).withRPH(textFieldRPH.text!)
        let originDestinationInformationBack = BFMOriginDestinationInformation(departureDateTime: textFieldReturnDate.text!, originLocation: BFMOriginLocation(locationCode: textFieldDestination.text!), destinationLocation: BFMDestinationLocation(locationCode: textFieldOrigin.text!)).withRPH("2")
        let pos = BFMPOS(sources: [BFMSource(requestorID: BFMRequestorID(companyName: BFMCompanyName(code: textFieldRequestorCompanyCode.text!), ID: textFieldRequestorID.text!, type: textFieldRequestorType.text!))])
        let travelerInfoSummary = BFMTravelerInfoSummary(airTravelerAvails: [BFMAirTravelerAvail(passengerTypeQuantities: [BFMPassengerTypeQuantity(quantity: Int(textFieldPassengerTypeQuantity.text!) ?? 1, code: textFieldPassengerCode.text!)])])
        let tpa_Extensions = BFMTPA_Extensions().withIntelliSellTransaction(BFMIntelliSellTransaction(requestType: BFMRequestType(name: textFieldRequestType.text!)))
        let travelPreferences = BFMTravelPreferences(cabinPreferences: [BFMCabin(cabin:textFieldCabin.text!)])
        let ota_AirLowFareSearchRQ = BFMOTA_AirLowFareSearchRQ(originDestinationInformations: [originDestinationInformationGo, originDestinationInformationBack], pos: pos, travelerInfoSummary: travelerInfoSummary).withTPAExtensions(tpa_Extensions).withTravelPreferences(travelPreferences)
        return BargainFinderMaxRequest(ota_AirLowFareSearchRQ: ota_AirLowFareSearchRQ)
    }
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        doExampleBargainFinderMaxRequest()
        resignFirstResponderFromAll()
    }
    
    private func resignFirstResponderFromAll() {
        textFieldOrigin.resignFirstResponder()
        textFieldDepartureDate.resignFirstResponder()
        textFieldDestination.resignFirstResponder()
        textFieldRPH.resignFirstResponder()
        textFieldRequestorCompanyCode.resignFirstResponder()
        textFieldRequestorID.resignFirstResponder()
        textFieldRequestorType.resignFirstResponder()
        textFieldPassengerTypeQuantity.resignFirstResponder()
        textFieldPassengerCode.resignFirstResponder()
        textFieldRequestType.resignFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationViewController = segue.destinationViewController as? SACSBFMPreviewOptionsViewController {
            destinationViewController.pricedItineraries = bargainFinderMaxResponse?.ota_AirLowFareSearchRS?.pricedItineraries
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
    @IBOutlet weak var textFieldDestination: UITextField!
    @IBOutlet weak var textFieldRPH: UITextField!
    @IBOutlet weak var textFieldDepartureDate: UITextField!
    @IBOutlet weak var textFieldRequestorCompanyCode: UITextField!
    @IBOutlet weak var textFieldRequestorID: UITextField!
    @IBOutlet weak var textFieldRequestorType: UITextField!
    @IBOutlet weak var textFieldPassengerTypeQuantity: UITextField!
    @IBOutlet weak var textFieldPassengerCode: UITextField!
    @IBOutlet weak var textFieldRequestType: UITextField!
    @IBOutlet weak var textFieldReturnDate: UITextField!
    @IBOutlet weak var textFieldCabin: UITextField!
}
