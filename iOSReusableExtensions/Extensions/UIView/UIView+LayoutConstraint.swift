//
//  UIView+LayoutConstraint.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

public extension UIView
{
    @objc func constraint(forAttribute attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint?
    {
        if
            attribute == .bottom
                || attribute == .top
                || attribute == .leading
                || attribute == .trailing
        {
            guard let aSuperview = self.superview else {
                return nil
            }
            weak var welf = self
            if let constraint = aSuperview.constraints.first(where: { (constraint) -> Bool in
                guard (constraint.firstItem === welf && constraint.firstAttribute == attribute) || (constraint.secondItem === welf && constraint.secondAttribute == attribute) else {
                    return false
                }
                return true
            }) {
                return constraint
            }
            return nil
        }
        
        if let constraint = self.constraints.first(where: { (constraint) -> Bool in
            if constraint.firstAttribute == attribute || constraint.secondAttribute == attribute {
                return true
            }
            return false
        }) {
            return constraint
        }
        return nil
    }
    
    @objc func constraint(withId perhapsId: String?) -> NSLayoutConstraint?
    {
        guard
            let id = perhapsId
            else
        {
            return nil
        }
        var constraints = self.constraints
        if let aSuperview = self.superview {
            constraints += aSuperview.constraints
        }
        if let constraint = constraints.first(where: { (constraint) -> Bool in
            guard constraint.identifier == id else {
                return false
            }
            return true
        }) {
            return constraint
        }
        return nil
    }
}
