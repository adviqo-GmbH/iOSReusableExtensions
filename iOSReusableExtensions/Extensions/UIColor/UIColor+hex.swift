//
//  UIColor+Extension.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

/*
 yannickl/YLColor.swift
 https://gist.github.com/yannickl/16f0ed38f0698d9a8ae7
*/

import UIKit

public extension UIColor
{
    convenience init(hex: Int)
    {
        self.init(hex: hex, a: 1.0)
    }

    convenience init(hex: Int, a: CGFloat)
    {
        self.init(r: (hex >> 16) & 0xff, g: (hex >> 8) & 0xff, b: hex & 0xff, a: a)
    }

    convenience init(r: Int, g: Int, b: Int)
    {
        self.init(r: r, g: g, b: b, a: 1.0)
    }

    convenience init(r: Int, g: Int, b: Int, a: CGFloat)
    {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }

    convenience init?(hex hexString: String)
    {
        var hexWithoutSymbols = hexString
        if hexWithoutSymbols.hasPrefix("#") {
            hexWithoutSymbols = hexString.substring(1)
        }
        guard let hexInt = hexWithoutSymbols.hex else { return nil }
        self.init(hex: hexInt)
    }
    
    convenience init?(hexString: String)
    {
        self.init(hex: hexString)
    }
    
    convenience init?(hex hexString: String, alpha: CGFloat)
    {
        guard let hex = hexString.hex else {
            return nil
        }
        
        self.init(hex: hex, a: alpha)
    }
    
    var hexString: String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"%06x", rgb)
    }
}

/*
import UIKit

public extension UIColor
{
    convenience init(hex: String)
    {
        self.init(hex: hex, alpha:1)
    }
    
    convenience init(hexString:String)
    {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner  = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    convenience init(hex: String, alpha: CGFloat)
    {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = hex.substring(1)
        }
        if hexWithoutSymbol.hasPrefix("ff") {
            hexWithoutSymbol = hexWithoutSymbol.substring(2)
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt:UInt32 = 0x0
        scanner.scanHexInt32(&hexInt)
        
        var r:UInt32!, g:UInt32!, b:UInt32!
        switch (hexWithoutSymbol.length) {
        case 3: // #RGB
            r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
            g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
            b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
            break;
        case 6: // #RRGGBB
            r = (hexInt >> 16) & 0xff
            g = (hexInt >> 8) & 0xff
            b = hexInt & 0xff
            break;
        default:
            // TODO:ERROR
            break;
        }
        
        self.init(
            red: (CGFloat(r)/255),
            green: (CGFloat(g)/255),
            blue: (CGFloat(b)/255),
            alpha:alpha)
    }
}
*/
