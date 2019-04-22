//
//  NumberFormatter+Double.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

public extension NumberFormatter
{
    static var double: NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale.current
        currencyFormatter.allowsFloats = true
        currencyFormatter.numberStyle = .decimal
        currencyFormatter.roundingMode = .floor
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.maximumFractionDigits = 2
        return currencyFormatter
    }
}
