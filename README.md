# Installation and configuration

To correctly clone Sabre Api Code Samples (iOS) example project the standard ```git clone``` method has to be extended like this:   

    git clone --recursive https://github.com/SabreDevStudio/SACS-iOS

in order to download attached submodules.

### Configuration

Before you start using Sabre Api Code Samples (iOS) classes few properties need to be set. Open the ```/Lib Classes/Common/SACSConfig.swift``` file and set static properties with your API keys gathered from [developer.sabre.com](https://developer.sabre.com/member/register):

```swift
class SACSConfig {
    static let userId = "your_user_ID"
    static let group = "your_group"
    static let domain = "your_domain"
    static let clientSecret = "your_client_secret"
    static let environment = "https://api.test.sabre.com" ## Please remember to change this to production one.
}
```

# Dependencies

Sabre Api Code Samples (iOS) uses two reliable and well known libraries as submodules.

- [Alamofire](https://github.com/Alamofire/Alamofire)
- [ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)

They are set to Sabre Api Code Samples (iOS) example projects as submodules. If you will take only _Library Classes_ to your project, please remember to include these libraries as well.

# Consuming/referencing the sample code/library

#### Taking library files to your project
You can always include the entire Sabre Api Code Samples (iOS) example project with attached submodules to your own project.
In case you would like to take only library classes (remember then to include also Alamofire and ObjectMapper) - all the necessary files are located inside the ```classes/Lib Classes``` where the folders structure looks like below:

    - classes/Lib Classes
        - Common/
        - LeadPriceCalendar/
        - InstaFlight/
        - BergainFinderMax/

```Common``` folder contains all classes that are shared between different modules (LeadPriceCalendar, InstaFlight, BargainFinderMax) like Request Managers or classes that will get Token for you.

```LeadPriceCalendar``` folder contains all models and requests used in communication with LeadPriceCalendar endpoints.

```InstaFlight``` folder contains all models and requests used in communication with InstaFlight endpoints.

```BargainFinderMax``` folder contains all models and requests used in communication with BargainFinderMax endpoints.

## Making requests

Sabre Api Code Samples (iOS) is designed to be very generic and easy to use or extend. In ```Common``` folder you will find generic and base classes for making _GET_ and _POST_ requests.

#### GET Requests

All the request classes (responsible for making _GET_ calls) extend base class named ```SACSBaseGetRequest```. Thanks to base implementation of said class all properties will be automatically parsed to url link while making a real _GET_ call.
To send prepared _GET_ requests we need to use generic class named:
```swift
SACSGenericRestGetCaller<RQType: SACSBaseGetRequest, RSType: Mappable>
```

SACSGenericRestGetCaller instance can be created with different initializers. You can use all parameters at once or just set them later as normal properties (example: url, request, tokenHolder).

Creating _GET_ rest caller instance:
```swift
   init()
   init(relativeURL: String)
   init(relativeURL: String, tokenHolder: SACSTokenStoringProtocol)
   init(request: RQType, relativeURL: String)
```
Generic rest caller will automatically obtain a valid token (and will use it in future) for you. In this case simply use a method listed below to make a call:
```swift
func doCall(completionHandler: (request: NSURLRequest?, response: RSType?, json: [String : AnyObject]?) -> ())
```
If for some reason you need to use other Token value in your call you can use the second method:
```swift
func doCallWithToken(token: SACSToken, completionHandler: (request: NSURLRequest?, response: RSType?, json: [String : AnyObject]?) -> ())
```

***LeadPriceCalendar example***
```swift
let lpcRestCaller = SACSGenericRestGetCaller<LeadPriceCalendarRequest, LeadPriceCalendarResponse>(relativeURL: "/v2/shop/flights/fares")
lpcRestCaller.request = LeadPriceCalendarRequest(origin: "LAX", destination: "JFK", lengthOfStay: 5).withPointOfSaleCountry("US")
lpcRestCaller.doCall { (request, response, json) -> () in
    // Here is your code
}
```
Just three lines of code here is what is relly needed to make a new call.

#### POST Requests

All the request classes (responsible for making _POST_ calls) implements protocol named ```Mappable```. Thanks to this all properties will be automatically parsed to JSON while making a real _POST_ call.
To send prepared _POST_ requests we need to use generic class named:
```swift
SACSGenericRestPostCaller<RQType: Mappable, RSType: Mappable>
```
As in _GET_ caller, SACSGenericRestPostCaller instance can be created with different initializers. You can use all parameters at once or just set them later as normal properties (example: relativeURL, request, tokenHolder).

Creating _POST_ rest caller instance:
```swift
   init()
   init(relativeURL: String)
   init(relativeURL: String, tokenHolder: SACSTokenStoringProtocol)
   init(request: RQType, relativeURL: String)
```
Generic _POST_ rest caller will automatically obtain a valid token (and will use it in future) for you. _POST_ caller has exactly the same methods as _GET_ caller to make calls:
```swift
func doCall(completionHandler: (request: NSURLRequest?, response: RSType?, json: [String : AnyObject]?) -> ())
func doCallWithToken(token: SACSToken, completionHandler: (request: NSURLRequest?, response: RSType?, json: [String : AnyObject]?) -> ())
```

***BargainFinderMax example***
```swift
let bfmRestCaller = SACSGenericRestPostCaller<BargainFinderMaxRequest, BargainFinderMaxResponse>(relativeURL: "/v1.9.0/shop/flights?mode=live")
bfmRestCaller.request = // set your BargainFinderMaxRequest instance
bfmRestCaller.doCall { (request, response, json) -> () in
    // Here is your code
}
```

### Token
As it was already mentioned, Token (instance of ```SACSToken``` class) will be automatically obtained with first request made to webservice.
If for some reason you will need to get it earlier there is a class (similar to _GET_ and _POST_ rest callers) named:
```swift
SACSTokenRestCaller<TokenType: SACSToken>
```
Creating _Token_ rest caller:
```swift
init(userID: String, group: String, domain: String, clientSecret: String, relativeURL: String)
```
Full example of getting Token:
``` swift
let tokenRestCaller = SACSTokenRestCaller<SACSToken>(userID: "user_ID", group: "user_group", domain: "user_domain", clientSecret: "client_secret", relativeURL: "token_url")
tokenRestCaller.getToken { (token, json) -> Void in
    // Here is your code
}
```
Token has to be kept in some way on a device so there is a defult storing policy (using NSUserDefaults). It's implemented in class ```SACSDefaultTokenHolder``` and it's the policy which is set to all rest callers (either _GET_ and _POST_) by default.
If you need some more secure policy (like advanced keychain) just create your own implementation of ```SACSTokenStoringProtocol``` protocol and set this to all your rest callers.

``` swift
class MyTokenStoringImplementation: SACSTokenStoringProtocol {
    var token: SACSToken? {
        get {
            // Here is your code
        }
        set {
            // Here is your code
        }
    }
}

...

myRestCaller.tokenHolder = MyTokenStoringImplementation()
```

# Extending the sample code/library

All the webservices can be extended in future with additional properties in responses or requests. Making changes to Sabre Api Code Samples (iOS) classes is super easy. All models extend ```Mappable``` protocol from _ObjectMapper_ library.
It makes parsing new objects very easy. If new class or properties has to be added just have a look how other properties and classes are annotated to be correctly parsed.

*As you probably saw earlier in _GET_ and _POST_ caller sections, responses always extend said ```Mappable``` protocol. In this case all responses are safely parsed to objects and are ready to use.

### Support

- [Stack Overflow](http://stackoverflow.com/questions/tagged/sabre)
- Need to report an issue/improvement? Use the built-in [issues](https://github.com/SabreDevStudio/SACS-iOS/issues) section.
- [Sabre Dev Studio](https://developer.sabre.com/)

### Disclaimer of Warranty and Limitation of Liability
This software and any compiled programs created using this software are furnished “as is” without warranty of any kind, including but not limited to the implied warranties of merchantability and fitness for a particular purpose. No oral or written information or advice given by Sabre, its agents or employees shall create a warranty or in any way increase the scope of this warranty, and you may not rely on any such information or advice. Sabre does not warrant, guarantee, or make any representations regarding the use, or the results of the use, of this software, compiled programs created using this software, or written materials in terms of correctness, accuracy, reliability, currentness, or otherwise. The entire risk as to the results and performance of this software and any compiled applications created using this software is assumed by you. Neither Sabre nor anyone else who has been involved in the creation, production or delivery of this software shall be liable for any direct, indirect, consequential, or incidental damages (including damages for loss of business profits, business interruption, loss of business information, and the like) arising out of the use of or inability to use such product even if Sabre has been advised of the possibility of such damages.
