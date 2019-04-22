//
//  UIDevice+Type.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

/*
 iOS Design
 https://kapeli.com/cheat_sheets/iOS_Design.docset/Contents/Resources/Documents/index
 */
@objc public enum DeviceType: Int
{
    case iPhone4OrLess
    case iPhone5
    case iPhone
    case iPhonePlus
    case iPhoneX
    case iPhoneXR
    case iPhoneXMax
    case iPad9_7
    case iPad10_5
    case iPad12_9
    case tv
    case carPlay
    case unspecified
}

@objc public extension UIDevice
{
    // MARK: - Public API
    @objc var type: DeviceType {
        // iPhone
        
        // iPhone 3.5-inch (iPhone 4, iPhone 4S)
        // Physical: 640 x 960
        // Logical: 320 x 480
        // Assets: @2x
        if UIDevice.current.userInterfaceIdiom == .phone && self.screenMaxLength < 568.0 {
            return .iPhone4OrLess
        }
        
        // iPhone 4-inch (iPhone 5, iPhone 5S, iPhone 5C, iPhone SE)
        // Physical: 640 x 1136
        // Logical: 320 x 568
        // Assets: @2x
        if UIDevice.current.userInterfaceIdiom == .phone && self.screenMaxLength == 568.0 {
            return .iPhone5
        }
        
        // iPhone 4.7-inch (iPhone 6, iPhone 6S, iPhone 7, iPhone 8)
        // Physical: 750 x 1334
        // Logical: 375 x 667
        // Assets: @2x
        if UIDevice.current.userInterfaceIdiom == .phone && self.screenMaxLength == 667.0 {
            return .iPhone
        }
        
        // iPhone 5.5-inch (iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus)
        // Physical: 1080 x 1920 (virtual: 1242 x 2208)
        // Logical: 414 x 736
        // Assets: @3x
        if UIDevice.current.userInterfaceIdiom == .phone && self.screenMaxLength == 736.0 {
            return .iPhonePlus
        }
        
        // iPhone 5.8-inch (iPhone X, iPhone XS)
        // Physical: 1125 x 2436
        // Logical: 375 x 812
        // Assets: @3x
        if UIDevice.current.userInterfaceIdiom == .phone && self.screenMaxLength == 812.0 {
            return .iPhoneX
        }
        
        // iPhone 6.1-inch (iPhone XR)
        // Physical: 828 x 1792
        // Logical: 414 x 896
        // Assets: @2x
        if UIDevice.current.userInterfaceIdiom == .phone && UIScreen.main.nativeBounds.size.height == 1792.0 {
            return .iPhoneXR
        }
        
        // iPhone 6.5-inch (iPhone XS Max)
        // Physical: 1242 x 2688
        // Logical: 414 x 896
        // Assets: @3x
        if UIDevice.current.userInterfaceIdiom == .phone && UIScreen.main.nativeBounds.size.height == 2688.0 {
            return .iPhoneXMax
        }
        
        // iPad
        
        // iPad 9.7-inch Retina (iPad 3, iPad 4, iPad Air, iPad Air 2, iPad Pro 9.7-inch, iPad 5th, iPad 6th)
        // Physical: 1536 x 2048
        // Logical: 768 x 1024
        // Assets: @2x
        if UIDevice.current.userInterfaceIdiom == .pad && self.screenMaxLength == 1024.0 {
            return .iPad9_7
        }
        
        // iPad Pro 10.5-inch (iPad Pro 10.5)
        // Physical: 1668 x 2224
        // Logical: 834 x 1112
        // Assets: @2x
        if UIDevice.current.userInterfaceIdiom == .pad && self.screenMaxLength == 1112.0 {
            return .iPad10_5
        }
        
        // iPad Pro 12.9-inch (iPad Pro 12.9 1st and iPad Pro 12.9 2nd)
        // Physical: 2048 x 2732
        // Logical: 1024 x 1366
        // Assets: @2x
        if UIDevice.current.userInterfaceIdiom == .pad && self.screenMaxLength == 1366.0 {
            return .iPad12_9
        }
        
        if UIDevice.current.userInterfaceIdiom == .tv {
            return .tv
        }
        
        if UIDevice.current.userInterfaceIdiom == .carPlay {
            return .carPlay
        }
        return .unspecified
    }
    
    @objc var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    @objc var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    @objc var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    @objc var tabBarHeight: CGFloat {
        if self.type == .iPhoneX {
            return 88
        }
        if self.type == .iPhoneXR {
            return 88
        }
        if self.type == .iPhoneXMax {
            return 88
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 85
        }
        // standard tab bar height for iPhone = 49
        return 49
    }
    
    // MARK: - Private
    fileprivate var screenMaxLength: CGFloat {
        return max(self.screenWidth, self.screenHeight)
    }
}
