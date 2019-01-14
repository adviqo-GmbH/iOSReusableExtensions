//
//  String+Evaluatable.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

extension String: Evaluatable
{
    public func evaluate(with condition: String) -> Bool
    {
        guard let range = range(of: condition,
                                options: .regularExpression,
                                range: nil,
                                locale: nil) else {
                                    return false
        }
        
        return range.lowerBound == startIndex
            && range.upperBound == endIndex
    }
}
