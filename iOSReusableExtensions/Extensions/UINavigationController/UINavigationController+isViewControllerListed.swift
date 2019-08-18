//
//  UINavigationController+isViewControllerListed.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 18.08.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

@objc public extension UINavigationController
{
    @objc func isViewControllerListed(withClass vcClass: UIViewController.Type) -> Bool
    {
        guard self.viewControllers.count > 0 else { return false }
        return self.viewControllers.contains(where: { $0.isKind(of: vcClass) })
    }
    
    @objc func isViewControllerListedLast(withClass vcClass: UIViewController.Type) -> Bool
    {
        guard self.viewControllers.count > 0 else { return false }
        if let last = self.viewControllers.last, last.isKind(of: vcClass) {
            return true
        }
        return false
    }
    
    @objc func viewController(withClass vcClass: UIViewController.Type) -> UIViewController?
    {
        guard self.viewControllers.count > 0 else { return nil }
        return self.viewControllers.filter({ $0.isKind(of: vcClass) }).last
    }
}
