//
//  String+hex.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 07.10.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

/*
 yannickl/YLColor.swift
 https://gist.github.com/yannickl/16f0ed38f0698d9a8ae7
*/

public extension String
{
    var hex: Int? {
        return Int(self, radix: 16)
    }
}
