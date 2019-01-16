//
//  FileManager+Extension.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 16.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

@objc public extension FileManager
{
    class func applicationDocumentsDirectory() -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]
        return paths.first!
    }
    
    class func cachesDirectory() -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]
        return paths.first!
    }
}
