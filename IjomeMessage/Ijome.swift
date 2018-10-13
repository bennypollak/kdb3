/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Defines the `Ijome` struct that represents a complete or partially built ice cream.
 */

import Foundation
import Messages

struct Ijome {
    
    // MARK: Properties
    var imageName:String
    var altImageName:String?
    var caption:String
    init(_ imageName:String, _ caption:String, _ altImageName:String? = nil) {
        self.imageName = imageName
        self.caption = caption
        self.altImageName = altImageName
    }
}

/// Extends `Ijome` to be able to be represented by and created with an array of `NSURLQueryItem`s.
extension Ijome {
    
    // MARK: Computed properties

    /// - Tag: QueryItems
    var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()
        items.append(URLQueryItem(name: "caption", value: caption))
        items.append(URLQueryItem(name: "imageName", value: imageName))
        return items
    }

    // MARK: Initialization
    
    init?(queryItems: [URLQueryItem]) {
        var imageName:String?
        var altImageName:String?
        var caption:String?

        for queryItem in queryItems {
            guard let value = queryItem.value else { continue }
            
            if queryItem.name == "imageName" {
                imageName = value
            } else if queryItem.name == "altImageName" {
                altImageName = value
            } else if queryItem.name == "caption" {
                caption = value
            }
        }
        
        self.imageName = imageName ?? ""
        self.altImageName = altImageName
        self.caption = caption ?? ""
    }
}

/// Extends `Ijome` to be able to be created with the contents of an `MSMessage`.

extension Ijome {
    
    // MARK: Initialization
    
    init?(message: MSMessage?) {
        guard let messageURL = message?.url else { return nil }
        guard let urlComponents = NSURLComponents(url: messageURL, resolvingAgainstBaseURL: false) else { return nil }
        guard let queryItems = urlComponents.queryItems else { return nil }
        self.init(queryItems: queryItems)
    }
    
}
