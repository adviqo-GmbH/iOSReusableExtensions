//
//  PropertyLoopable.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

public enum PropertyLoopableError: Error
{
    case unsupportedType(message: String)
}

public protocol PropertyLoopable
{
    func allProperties() throws -> [String: Any]
}

public extension PropertyLoopable
{
    func allProperties() throws -> [String: Any]
    {
        
        var result: [String: Any] = [:]
        
        let mirror = Mirror(reflecting: self)
        
        guard
            let style = mirror.displayStyle,
            style == .struct || style == .class
            else
        {
            throw PropertyLoopableError.unsupportedType(message: "PropertyLoopable supports only structs and classes")
        }
        
        for (labelMaybe, valueMaybe) in mirror.children {
            guard let label = labelMaybe else {
                continue
            }
            
            result[label] = valueMaybe
        }
        return result
    }
    
    func allValues() throws -> [Any]
    {
        let mirror = Mirror(reflecting: self)
        guard
            let style = mirror.displayStyle,
            style == .struct || style == .class
            else
        {
            throw PropertyLoopableError.unsupportedType(message: "PropertyLoopable supports only structs and classes")
        }
        return mirror.children.compactMap({$0.value})
    }
}
