//
//  SACSGenericRestGetCaller.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 12.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import Alamofire
import ObjectMapper

class SACSGenericRestGetCaller<RQType: SACSBaseGetRequest, RSType: Mappable>: SACSGenericRestCaller<RSType> {
    var request: RQType?
    
    override init() { super.init() }
    override init(relativeURL: String) { super.init(relativeURL: relativeURL) }
    override init(relativeURL: String, tokenHolder: SACSTokenStoringProtocol) { super.init(relativeURL: relativeURL, tokenHolder: tokenHolder) }
    init(request: RQType, relativeURL: String) {
        self.request = request
        super.init(relativeURL: relativeURL)
    }
    
    override func doCallWithToken(accessToken: String, tokenType: String, completionHandler: (request: NSURLRequest?, response: RSType?, json: [String : AnyObject]?) -> ()) {
        let headers = ["Authorization" : "\(tokenType) \(accessToken)"]
        var parameters: [String:AnyObject]?
        if let request = request {parameters = request.parameters()}
        Alamofire.request(.GET, url, parameters: parameters, headers: headers).responseJSON { response in
            let mappedResponse = Mapper<RSType>().map(response.result.value)
            let JSON = response.result.value as? [String:AnyObject]
            completionHandler(request: response.request , response: mappedResponse, json: JSON)
        }
    }
    
    func doCallWithToken(token: SACSToken, completionHandler: (request: NSURLRequest?, response: RSType?, json: [String : AnyObject]?) -> ()) {
        self.doCallWithToken(token.accessToken, tokenType: token.tokenType, completionHandler: completionHandler)
    }

}
