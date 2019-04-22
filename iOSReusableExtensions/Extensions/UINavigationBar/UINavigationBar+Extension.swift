//
//  UINavigationBar+Extension.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 16.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

@objc public extension UINavigationBar
{
    @objc func setGradientBackground(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint)
    {
        let gradientFrame:CGRect
        if UIDevice.current.type == .iPhoneX {
            gradientFrame = CGRect(x: 0, y: 0, width: bounds.size.width, height: 100)
        } else {
            gradientFrame = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height + 20)
        }
        let gradientLayer = CAGradientLayer(frame: gradientFrame, colors: colors, startPoint: startPoint, endPoint: endPoint)
        
        setBackgroundImage(gradientLayer.creatGradientImage(), for: UIBarMetrics.default)
    }
    
    @objc func setShadow(withColor color: UIColor, opacity: Float, offset: CGSize, andRadius radius: CGFloat)
    {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
}
