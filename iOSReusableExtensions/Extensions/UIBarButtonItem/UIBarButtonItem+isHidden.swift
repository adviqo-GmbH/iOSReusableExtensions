//
//  UIBarButtonItem+Extension.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

public extension UIBarButtonItem
{
    var isHidden: Bool {
        set {
            self.isEnabled = newValue
            self.tintColor = newValue ? self.tintColor : UIColor.clear
        }
        get {
            return self.isEnabled
        }
    }
}
