//
//  UIViewController+isModal.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 22.04.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

@objc public extension UIViewController
{
    @objc var isModal: Bool {
        if let navigationController = self.navigationController{
            if navigationController.viewControllers.first != self{
                return false
            }
        }
        
        if self.presentingViewController != nil {
            return true
        }
        
        if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController  {
            return true
        }
        
        if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        
        return false
        
    }
}
