//
//  SACSBaseGetRequest.swift
//  DevEssentials
//
//  Created by Krystian Sęk on 12.11.2015.
//  Copyright © 2015 Sabre. All rights reserved.
//

class SACSBaseGetRequest {
    
    func parameters() -> [String : AnyObject] {
        var parameters = [String : AnyObject]()
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let
                propertyName = child.label,
                propertyValue = self.unwrap(child.value) as? AnyObject
            { parameters[propertyName.lowercaseString] = propertyValue }
        }
        return parameters
    }
    
    private func unwrap(subject: Any) -> Any? {
        var value: Any?
        let mirrored = Mirror(reflecting:subject)
        if mirrored.displayStyle != .Optional {
            value = subject
        } else if let firstChild = mirrored.children.first {
            value = firstChild.value
        }
        return value
    }
}
