//
//  UIScrollView+scrollTo.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

public extension UIScrollView
{
    func scrollToToTopLeft(animated: Bool)
    {
        self.setContentOffset(CGPoint.zero, animated: animated)
    }
    
    func scrollToRight(animated: Bool)
    {
        let widthOffset = CGPoint(x: self.contentSize.width - self.bounds.size.width, y: 0)
        self.setContentOffset(widthOffset, animated: animated)
    }
    
    func scrollToBottom(animated: Bool)
    {
        let heightOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(heightOffset, animated: animated)
    }
}
