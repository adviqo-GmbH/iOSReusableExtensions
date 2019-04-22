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
    case unknown
}

public extension UIDevice
{
    static func biometricType() -> BiometricType
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
            @unknown default:
                return .unknown
            }
        } else {
            return authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) ? .touch : .none
        }
    }
}
