//
//  Utility.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 16.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//
import UIKit

@objcMembers
public class Utility: NSObject
{
    // Logs all available fonts from iOS SDK and installed custom font
    public class func logAllAvailableFonts()
    {
        for family in UIFont.familyNames {
            print("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
    }
}
