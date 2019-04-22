//
//  UITextField+Extension.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

/*
 Color Tint UIButton Image
 http://stackoverflow.com/questions/19829356/color-tint-uibutton-image
 
 Swift add icon/image in UITextField
 http://stackoverflow.com/questions/27903500/swift-add-icon-image-in-uitextfield
 */

import UIKit

public extension UITextField
{
    var isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func addPaddingLeft(_ padding: CGFloat)
    {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    func addPaddingLeftIcon(_ image: UIImage, padding: CGFloat)
    {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        self.leftView = imageView
        self.leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        self.leftViewMode = UITextField.ViewMode.always
    }
}
