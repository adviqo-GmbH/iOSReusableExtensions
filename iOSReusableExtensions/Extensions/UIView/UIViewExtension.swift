//
//  UIViewExtension.swift
//  iOSReusableExtensions
//
//  Created by Aleksei Neronov on 27.04.20.
//  Copyright © 2020 adviqo. All rights reserved.
//

import UIKit

extension UIView {

    public func roundCorner(radiuses: [CGFloat], borderColor: UIColor, borderWidth: CGFloat) {
        layer.sublayers?.reversed().forEach { layer in
            if layer.name == "borderLayer" {
                layer.removeFromSuperlayer()
            }
        }
        let path = strictRounded(radiuses: radiuses)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        let borderPath = strictRounded(radiuses: radiuses)
        let borderLayer = CAShapeLayer()
        borderLayer.path = borderPath.cgPath
        borderLayer.lineWidth = borderWidth
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.frame = self.bounds
        borderLayer.name = "borderLayer"
        self.layer.addSublayer(borderLayer)
    }
    
    @discardableResult
    public func noAutoResize() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    private func strictRounded(radiuses: [CGFloat]) -> UIBezierPath {
        let minx = bounds.minX
        let miny = bounds.minY
        let maxx = bounds.maxX
        let maxy = bounds.maxY

        let path = UIBezierPath()
        path.move(to: CGPoint(x: minx + radiuses[0], y: miny))
        var radius = radiuses[1]
        path.addLine(to: CGPoint(x: maxx - radius, y: miny))
        path.addArc(
            withCenter: CGPoint(x: maxx - radius, y: miny + radius),
            radius: radius,
            startAngle: CGFloat(3 * Double.pi / 2),
            endAngle: 0,
            clockwise: true)
        radius = radiuses[2]
        path.addLine(to: CGPoint(x: maxx, y: maxy - radius))
        path.addArc(
            withCenter: CGPoint(x: maxx - radius, y: maxy - radius),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat(Double.pi / 2),
            clockwise: true)
        radius = radiuses[3]
        path.addLine(to: CGPoint(x: minx + radius, y: maxy))
        path.addArc(
            withCenter: CGPoint(x: minx + radius, y: maxy - radius),
            radius: radius,
            startAngle: CGFloat(Double.pi / 2),
            endAngle: CGFloat(Double.pi),
            clockwise: true)
        radius = radiuses[0]
        path.addLine(to: CGPoint(x: minx, y: miny + radius))
        path.addArc(
            withCenter: CGPoint(x: minx + radius, y: miny + radius),
            radius: radius,
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(3 * Double.pi / 2),
            clockwise: true)
        path.close()
        return path
    }
    
    public static func animateOrNot(
        _ animate: Bool,
        withDuration duration: TimeInterval,
        animations: @escaping () -> Void,
        completion: ((Bool) -> Void)?
    ) {
        if animate {
            Self.animate(withDuration: duration, animations: animations, completion: completion)
        } else {
            animations()
            completion?(true)
        }
    }
}
