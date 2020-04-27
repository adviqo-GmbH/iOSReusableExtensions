//
//  NSDateExtension.swift
//  iOSReusableExtensions
//
//  Created by Aleksei Neronov on 27.04.20.
//  Copyright © 2020 adviqo. All rights reserved.
//

import Foundation

@objc public extension NSDate {
    
    // Returns the amount of years from another date
    func years(from date: NSDate) -> Int {
        return Calendar.current.dateComponents([.year], from: date as Date, to: self as Date).year ?? 0
    }
    
    // Returns the amount of months from another date
    func months(from date: NSDate) -> Int {
        return Calendar.current.dateComponents([.month], from: date as Date, to: self as Date).month ?? 0
    }
    
    // Returns the amount of weeks from another date
    func weeks(from date: NSDate) -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: date as Date, to: self as Date).weekOfYear ?? 0
    }
    
    // Returns the amount of days from another date
    func days(from date: NSDate) -> Int {
        return Calendar.current.dateComponents([.day], from: date as Date, to: self as Date).day ?? 0
    }
    
    // Returns the amount of hours from another date
    func hours(from date: NSDate) -> Int {
        return Calendar.current.dateComponents([.hour], from: date as Date, to: self as Date).hour ?? 0
    }
    
    // Returns the amount of minutes from another date
    func minutes(from date: NSDate) -> Int {
        return Calendar.current.dateComponents([.minute], from: date as Date, to: self as Date).minute ?? 0
    }
    
    // Returns the amount of seconds from another date
    func seconds(from date: NSDate) -> Int {
        return Calendar.current.dateComponents([.second], from: date as Date, to: self as Date).second ?? 0
    }
}
