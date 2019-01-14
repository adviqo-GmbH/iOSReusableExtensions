//
//  Validatable.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

public protocol Validatable
{
    associatedtype T
    
    func validate(_ functions: [T]) -> Bool
}
