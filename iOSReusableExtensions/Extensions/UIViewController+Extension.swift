//
//  UIViewController+Extension.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

public extension UIViewController
{
    class func loadFromNib<T: UIViewController>() -> T
    {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
    var isVisible: Bool {
        return isViewLoaded && view.window != nil
    }
}
