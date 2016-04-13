//
//  SACSLPCFormViewController.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 15.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import UIKit

class SACSLPCFormViewController: SACSExampleRequestSendingController, UITextFieldDelegate {

    let lpcRestCaller = SACSGenericRestGetCaller<LeadPriceCalendarRequest, LeadPriceCalendarResponse>(relativeURL: "/v2/shop/flights/fares")
    var leadPriceCalendarResponse: LeadPriceCalendarResponse?
    
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
    
    func doExampleLeadPriceCalendarRequest() {
        if let
            origin = textFieldOrigin.text,
            destination = textFieldDestination.text,
            lengthOfStayText = textFieldLengthOfStay.text,
            lengthOfStay = Int(lengthOfStayText),
            pointOfSalesCountry = textFieldPointOfSalesCountry.text
        {
            prepareForDownload()
            lpcRestCaller.request = LeadPriceCalendarRequest(origin: origin, destination: destination, lengthOfStay: lengthOfStay).withPointOfSaleCountry(pointOfSalesCountry)
            lpcRestCaller.doCall { (request, response, json) -> () in
                self.leadPriceCalendarResponse = response
                
                self.request = request
                self.JSON = json
                self.setUIDownloaded()
                self.performSegueWithIdentifier("LPCshowPreviewOptions", sender: self)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationController = segue.destinationViewController as? SACSLPCPreviewOptionsViewController {
            destinationController.fareInfos = leadPriceCalendarResponse?.fareInfos
        }
        super.prepareForSegue(segue, sender: sender)
    }
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        doExampleLeadPriceCalendarRequest()
        resignFirstResponderFromAll()
    }
    
    private func resignFirstResponderFromAll() {
        textFieldOrigin.resignFirstResponder()
        textFieldPointOfSalesCountry.resignFirstResponder()
        textFieldLengthOfStay.resignFirstResponder()
        textFieldDestination.resignFirstResponder()
    }
    
    // MARK: -
    // MARK: UITextFieldDelegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textFieldOrigin: UITextField!
    @IBOutlet weak var textFieldLengthOfStay: UITextField!
    @IBOutlet weak var textFieldDestination: UITextField!
    @IBOutlet weak var textFieldPointOfSalesCountry: UITextField!
}

class SACSExampleRequestSendingController: UIViewController {
    var request: NSURLRequest?
    var JSON: [String : AnyObject]?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationController = segue.destinationViewController as! SACSPreviewOptionsViewController
        if let JSON = JSON, request = request {
            destinationController.responseString = JSON.description
            destinationController.requestString = "URL: \n \(request.URLString)"
            if let httpBody = request.HTTPBody, jsonBody = String(data: httpBody, encoding: NSUTF8StringEncoding) {
                destinationController.requestString = destinationController.requestString + "\n\nJSON Body:\n \(jsonBody)"
            }
            destinationController.requestString = destinationController.requestString + "\n\nHeaders: \n" + ((request.allHTTPHeaderFields?.description) ?? "")
        }
    }
    
    @IBOutlet weak var downloadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var submitButton: SACSBorderedButton!
    
    func prepareForDownload() {
        downloadIndicator.startAnimating()
        submitButton.enabled = false
        submitButton.setTitle("Fetching data...", forState: .Normal)
    }
    
    func setUIDownloaded() {
        downloadIndicator.stopAnimating()
        submitButton.enabled = true
        submitButton.setTitle("Submit", forState: .Normal)
    }
}
