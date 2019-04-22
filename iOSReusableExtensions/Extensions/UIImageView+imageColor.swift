//
//  UIImageView+imageColor.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

@objc public extension UIImageView
{
    @objc var imageColor: UIColor? {
        get {
            return self.tintColor
        }
        set {
            let origImage = self.image
            let tintedImage = origImage?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            self.image = tintedImage
            self.tintColor = newValue
        }
    }
}
