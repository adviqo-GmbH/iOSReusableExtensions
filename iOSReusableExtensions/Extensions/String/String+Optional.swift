//
//  String+Optional.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

/*
 Handling empty optional strings in Swift
 https://medium.com/ios-os-x-development/handling-empty-optional-strings-in-swift-ba77ef627d74
 */
public extension Optional where Wrapped == String
{
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
    
    var firstUppercased: String? {
        guard let strongSelf = self else {
            return nil
        }
        guard !strongSelf.isEmpty else {
            return nil
        }
        guard let first = strongSelf.first else { return "" }
        return String(first).uppercased() + strongSelf.dropFirst()
    }
}
