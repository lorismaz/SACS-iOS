//
//  SACSGenericRestCaller.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 12.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

import Alamofire
import ObjectMapper

class SACSGenericRestCaller<RSType: Mappable> {
    var relativeURL: String?
    var absoluteURL: String?
    var url: String {
        get {
            if let absoluteURL = absoluteURL { return absoluteURL }
            else { return relativeURL != nil ? SACSConfig.environment + relativeURL! : "" }
        }
    }

    var tokenHolder: SACSTokenStoringProtocol = SACSDefaultTokenHolder()
    let tokenRestCaller = SACSTokenRestCaller<SACSToken>(userID: SACSConfig.userId, group: SACSConfig.group, domain: SACSConfig.domain, clientSecret: SACSConfig.clientSecret, relativeURL: "/v2/auth/token")
    
    init() {}
    init(relativeURL: String) { self.relativeURL = relativeURL }
    init(relativeURL: String, tokenHolder: SACSTokenStoringProtocol) {
        self.relativeURL = relativeURL
        self.tokenHolder = tokenHolder
    }
    
    func doCall(completionHandler: (request: NSURLRequest?, response: RSType?, json: [String : AnyObject]?) -> ()) {
        if let token = tokenHolder.token where token.isValid() {
            doCallWithToken(token.accessToken, tokenType: token.tokenType, completionHandler: completionHandler)
        } else {
            tokenRestCaller.getToken({ (token, json) -> Void in
                if let token = token {
                    self.tokenHolder.token = token
                    self.doCallWithToken(token.accessToken, tokenType: token.tokenType, completionHandler: completionHandler)
                }
            })
        }
    }
    
    func doCallWithToken(accessToken: String, tokenType: String, completionHandler: (request: NSURLRequest?, response: RSType?, json: [String : AnyObject]?) -> ()) {
        fatalError("Method doCallWithToken needs to be overridden")
    }
}

class SACSToken: Mappable {
    var accessToken = ""
    var tokenType = ""
    var expiresIn = 0
    var creationDate = NSDate()
    
    init(accessToken: String, tokenType: String, expiresIn: Int, creationDate: NSDate) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expiresIn
        self.creationDate = creationDate
    }
    
    func isValid() -> Bool {
        return NSDate().timeIntervalSinceDate(creationDate)<Double(expiresIn)
    }
    
    // MARK: -
    // MARK: ObjectMapper Methods
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        accessToken <- map["access_token"]
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
    }
}

class SACSTokenRestCaller<TokenType: SACSToken> {
    var relativeURL: String?
    var url: String {
        get { if let relativeURL = relativeURL { return SACSConfig.environment + relativeURL} else { return "" } }
    }
    var userID: String
    var group: String
    var domain: String
    var clientSecret: String
    
    init(userID: String, group: String, domain: String, clientSecret: String, relativeURL: String) {
        self.userID = userID
        self.group = group
        self.domain = domain
        self.clientSecret = clientSecret
        self.relativeURL = relativeURL
    }
    
    func getToken(completionHandler: (token: TokenType?, json: [String : AnyObject]?) -> Void) {
        let body = ["grant_type":"client_credentials"]
        let headers = ["Authorization" : "Basic \(generateEncodedCredentials())", "Content-Type" : "application/x-www-form-urlencoded"]
        Alamofire.Manager.sharedInstance.request(.POST, url, parameters: body, headers: headers).responseJSON { response in
            let JSON = response.result.value as? [String : AnyObject]
            let token = Mapper<TokenType>().map(JSON)
            completionHandler(token: token, json: JSON)
        }
    }
    
    private func generateEncodedCredentials() -> String {
        let clientID = "V1:" + userID + ":" + group + ":" + domain
        let encodedClientID = clientID.dataUsingEncoding(NSUTF8StringEncoding)!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        let encodedClientSecret = clientSecret.dataUsingEncoding(NSUTF8StringEncoding)!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        let encodedClientIdAndSecret = encodedClientID + ":" + encodedClientSecret
        return encodedClientIdAndSecret.dataUsingEncoding(NSUTF8StringEncoding)!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
    }
    
}

protocol SACSTokenStoringProtocol {
    var token: SACSToken? { get set }
}

class SACSDefaultTokenHolder: SACSTokenStoringProtocol {
    
    var token: SACSToken? {
        didSet { saveToken() }
    }
    
    init() {
        token = self.loadToken()
    }
    
    private func saveToken() {
        // It's simple example how token can be stored. It's up to developer how he wants to store retrieved token.
        // It's worthy of noting that NSUserDefaults is not a safe option. Please consider storing all credentials (including token)
        // In keychain as it's safe.
        if let token = token {
            NSUserDefaults.standardUserDefaults().setObject(token.accessToken, forKey: "de_accessToken")
            NSUserDefaults.standardUserDefaults().setObject(token.tokenType, forKey: "de_tokenType")
            NSUserDefaults.standardUserDefaults().setInteger(token.expiresIn, forKey: "de_expiresIn")
            NSUserDefaults.standardUserDefaults().setDouble(token.creationDate.timeIntervalSince1970, forKey: "de_creationDate")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    private func loadToken() -> SACSToken? {
        if let
            tokenType =  NSUserDefaults.standardUserDefaults().objectForKey("de_tokenType") as? String,
            accessToken = NSUserDefaults.standardUserDefaults().objectForKey("de_accessToken") as? String
        {
            let expiresIn = NSUserDefaults.standardUserDefaults().integerForKey("de_expiresIn")
            let creationDate =  NSDate(timeIntervalSince1970: NSUserDefaults.standardUserDefaults().doubleForKey("de_creationDate"))
            return SACSToken(accessToken: accessToken, tokenType: tokenType, expiresIn: expiresIn, creationDate: creationDate)
        } else { return nil }
    }
}
