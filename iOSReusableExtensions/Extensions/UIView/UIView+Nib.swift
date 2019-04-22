//
//  UIView+Nib.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

public extension UIView
{
    class func loadNib<T: UIView>(_ viewType: T.Type) -> T
    {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    @objc class func loadNib() -> Self
    {
        return loadNib(self)
    }
}
