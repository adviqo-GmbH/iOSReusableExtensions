//
//  UIImage+Extension.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 16.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

@objc public extension UIImage
{
    @objc var noir: UIImage? {
        let context = CIContext(options: nil)
        guard let currentFilter = CIFilter(name: "CIPhotoEffectNoir") else { return nil }
        currentFilter.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        if let output = currentFilter.outputImage,
            let cgImage = context.createCGImage(output, from: output.extent) {
            return UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        }
        return nil
    }
}
