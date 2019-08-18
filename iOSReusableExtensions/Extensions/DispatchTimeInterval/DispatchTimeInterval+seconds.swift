//
//  DispatchTimeInterval+seconds.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 18.08.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

/*
 5 Easy Dispatch Tricks
 https://ericasadun.com/2017/05/23/5-easy-dispatch-tricks/
 */

import Foundation

extension DispatchTimeInterval
{
    public static func seconds(_ amount: Double) -> DispatchTimeInterval
    {
        let delay = Double(NSEC_PER_SEC) * amount
        return DispatchTimeInterval.nanoseconds(Int(delay))
    }
}
