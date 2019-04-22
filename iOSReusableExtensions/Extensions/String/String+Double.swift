//
//  String+Double.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

// Double value from string
public extension String
{
    var doubleValue: Double? {
        get {
            guard self.isValidDouble(withDecimalPlaces: 2) else {
                return nil
            }
            let formatter = NumberFormatter.double
            
            var updatedSelf: String
            if let groupingSeparator = formatter.groupingSeparator.nilIfEmpty {
                updatedSelf = self.components(separatedBy: groupingSeparator).joined()
            }
            updatedSelf = self.components(separatedBy: CharacterSet.whitespaces).joined()
            guard let doubleValue = formatter.number(from: updatedSelf)?.doubleValue else {
                return nil
            }
            return doubleValue
        }
    }
    
    func isValidDouble(withDecimalPlaces decimalPlaces: Int) -> Bool
    {
        let updatedSelf: String = self.components(separatedBy: CharacterSet.whitespaces).joined()
        
        let result = [",", "."]
            .map { amountRegex(separator: $0, decimalPlaces: decimalPlaces) }
            .map { updatedSelf.evaluate(with: $0) }
            .reduce(false) { $0 || $1 }
        
        return result
    }
}

private func amountRegex(separator: String, decimalPlaces: Int) -> String
{
    return "^[0-9]+(?:\\\(separator)[0-9]{0,\(decimalPlaces)})?$"
}
