//
//  UIView+Appearance.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

public extension UIView
{
    func makeRoundedCorners(radius: CGFloat)
    {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor)
    {
        DispatchQueue.main.async {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
            gradientLayer.locations = [ 0.0, 1.0]
            let size = UIScreen.main.bounds.size
            gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            self.layer.masksToBounds = true
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    class func setupGradientImage(colorTop: UIColor, colorBottom: UIColor) -> UIImage?
    {
        let gradient = CAGradientLayer()
        let size = UIScreen.main.bounds.size
        let defaultNavigationBarFrame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradient.frame = defaultNavigationBarFrame
        gradient.colors = [colorTop.cgColor, colorBottom.cgColor]
        
        UIGraphicsBeginImageContext(gradient.frame.size)
        gradient.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage
    }
    
    func createShadow(withColor color: UIColor)
    {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = color.cgColor
    }
}
