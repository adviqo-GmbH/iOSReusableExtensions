//
//  DateExtension.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

public extension Foundation.Date
{
    var startOfDay: Foundation.Date {
        return Calendar.current.startOfDay(for: self)
    }
    
    var endOfDay: Foundation.Date? {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: self.startOfDay)
    }
    
    var startOfMonth: Foundation.Date {
        let components = Calendar.current.dateComponents([.year, .month], from: self.startOfDay)
        return Calendar.current.date(from: components)!
    }
    
    var endOfMonth: Foundation.Date? {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth)
    }
    
    // Returns the amount of years from another date
    func years(from date: Foundation.Date) -> Int
    {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    
    // Returns the amount of months from another date
    func months(from date: Foundation.Date) -> Int
    {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    // Returns the amount of weeks from another date
    func weeks(from date: Foundation.Date) -> Int
    {
        return Calendar.current.dateComponents([.weekOfYear], from: date, to: self).weekOfYear ?? 0
    }
    
    // Returns the amount of days from another date
    func days(from date: Foundation.Date) -> Int
    {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    // Returns the amount of hours from another date
    func hours(from date: Foundation.Date) -> Int
    {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    // Returns the amount of minutes from another date
    func minutes(from date: Foundation.Date) -> Int
    {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    // Returns the amount of seconds from another date
    func seconds(from date: Foundation.Date) -> Int
    {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    // Returns a Date with the specified amount of components added to the one it is called with
    func add(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        let components = DateComponents(year: years, month: months, day: days, hour: hours, minute: minutes, second: seconds)
        return Calendar.current.date(byAdding: components, to: self)
    }
    
    // Returns a Date with the specified amount of components subtracted from the one it is called with
    func subtract(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        return add(years: -years, months: -months, days: -days, hours: -hours, minutes: -minutes, seconds: -seconds)
    }
}
