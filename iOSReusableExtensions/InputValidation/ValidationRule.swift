//
//  ValidationRule.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

public struct ValidationRule
{
    public var rule: UserInputValidationType
    public var message: String?
    
    public init(rule: UserInputValidationType, message: String? = nil) {
        self.rule = rule
        self.message = message
    }
}
