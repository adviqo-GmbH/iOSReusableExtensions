//
//  UIStackView+RemoveAll.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 22.04.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

@objc public extension UIStackView
{
    @objc func removeAll()
    {
        let _ = arrangedSubviews.reduce([]) { (removedSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            NSLayoutConstraint.deactivate(subview.constraints)
            subview.removeFromSuperview()
            return removedSubviews + [subview]
        }
    }
    
    @objc func removedAll() -> [UIView]
    {
        let removedSubviews = arrangedSubviews.reduce([]) { (removedSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            NSLayoutConstraint.deactivate(subview.constraints)
            subview.removeFromSuperview()
            return removedSubviews + [subview]
        }
        return removedSubviews
    }
}
