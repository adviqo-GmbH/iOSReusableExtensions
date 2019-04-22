//
//  CAGradientLayer+Extension.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 16.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

@objc public extension CAGradientLayer
{
    convenience init(frame: CGRect, colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint)
    {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    func creatGradientImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}
