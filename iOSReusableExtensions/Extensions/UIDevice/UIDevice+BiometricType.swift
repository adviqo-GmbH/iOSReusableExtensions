//
//  UIDevice+BiometricType.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation
import LocalAuthentication

public enum BiometricType
{
    case none
    case touch
    case face
}

public extension UIDevice
{
    static public func biometricType() -> BiometricType
    {
        let authContext = LAContext()
        var error: NSError?
        if #available(iOS 11, *) {
            let result = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
            if !result {
                return .none
            }
            switch(authContext.biometryType) {
            case .none:
                return .none
            case .touchID:
                return .touch
            case .faceID:
                return .face
            }
        } else {
            return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) ? .touch : .none
        }
    }
}
