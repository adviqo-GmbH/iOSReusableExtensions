//
//  UIView+Animation.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

public extension UIView
{
    func set(anchorPoint: CGPoint)
    {
        let newPoint = CGPoint(
            x: self.bounds.size.width * anchorPoint.x,
            y: self.bounds.size.height * anchorPoint.y
            ).applying(self.transform)
        let oldPoint = CGPoint(
            x: self.bounds.size.width * self.layer.anchorPoint.x,
            y: self.bounds.size.height * self.layer.anchorPoint.y
            ).applying(self.transform)
        var position = self.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        position.y -= oldPoint.y
        position.y += newPoint.y
        self.layer.position = position
        self.layer.anchorPoint = anchorPoint
    }
}
