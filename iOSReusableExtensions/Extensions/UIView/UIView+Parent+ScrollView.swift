//
//  UIView+Parent+ScrollView.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

public extension UIView
{
    public func closestParentWith(class currentClass: AnyClass) -> UIView?
    {
        if self.isKind(of: currentClass) {
            return self
        }
        guard let superView = self.superview else {
            return nil
        }
        return superView.closestParentWith(class:currentClass)
    }

    public func rootView() -> UIView
    {
        return superview?.rootView() ?? superview ?? self
    }

    public func parentScrollView() -> UIScrollView?
    {
        guard let scrollView = self.closestParentWith(class: UIScrollView.self) as? UIScrollView else {
            return nil
        }
        return scrollView
    }
    
    @objc public var scrollView: UIScrollView? {
        get {
            if let scrollView = self.subviews.first(where: { (view) -> Bool in
                if view is UIScrollView {
                    return true
                }
                return false
            }) as? UIScrollView {
                return scrollView
            }
            
            return nil
        }
    }
}
