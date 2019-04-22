//
//  UIApplication+topViewController.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//
import UIKit

@objc public extension UIApplication
{
    @objc var topViewController: UIViewController?
    {
        return UIApplication.topViewController()
    }
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?
    {
        // UINavigationController
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        
        // UITabBarController
        if
            let tab = viewController as? UITabBarController,
            let selected = tab.selectedViewController
        {
            return topViewController(selected)
        }
        
        // presentedViewController
        if
            let presented = viewController?.presentedViewController,
            presented is UIAlertController == false
        {
            return topViewController(presented)
        }
        
        return viewController
    }
}
