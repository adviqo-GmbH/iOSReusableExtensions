//
//  Evaluatable.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

public protocol Evaluatable
{
    associatedtype T
    
    func evaluate(with condition: T) -> Bool
}
