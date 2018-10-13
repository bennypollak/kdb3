//
//  IjomePart.swift
//  IjomeMessage
//
//  Created by Benny Pollak on 10/10/18.
//  Copyright © 2018 Alben Software. All rights reserved.
//

import Foundation
/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 The protocol and enums that define the different types of body parts that are used to build an ejomi.
 */

import UIKit

protocol IjomePart {
    
    var rawValue: String { get }
    
    var image: UIImage { get }
    
    var stickerImage: UIImage { get }
    
}


/// Extends `IjomePart` to provide a default implementation of the `image` and `stickerImage` properties.

extension IjomePart {
    var image: UIImage {
        let imageName = self.rawValue
        guard let image = UIImage(named: imageName) else { fatalError("Unable to find image named \(imageName)") }
        return image
    }
    
    var stickerImage: UIImage {
        let imageName = "\(self.rawValue)_sticker"
        guard let image = UIImage(named: imageName) else { fatalError("Unable to find image named \(imageName)") }
        return image
    }
}

/// Extends instances of `QueryItemRepresentable` that also conformt to `IjomePart` to provide a default implementation of `queryItem`.

extension QueryItemRepresentable where Self: IjomePart {
    var queryItem: URLQueryItem {
        return URLQueryItem(name: Self.queryItemKey, value: rawValue)
    }
    
}
