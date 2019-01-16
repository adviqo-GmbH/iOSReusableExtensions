//
//  UserInputValidationType.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation
import CoreLocation
import InputMask

public enum UserInputValidationType
{
    case address(locale: Locale, completion: (_ isValid: Bool) -> Void)
    case houseNumber(locale: Locale, completion: (_ isValid: Bool) -> Void)
    case city(locale: Locale, completion: (_ isValid: Bool, _ placemarks: [CLPlacemark]?) -> Void)
    case street(locale: Locale, completion: (_ isValid: Bool, _ street: String?) -> Void)
    case server
    case emptyString
    case email
    case numbersOnly
    case decimalsOnly
    case minValue(value: Int)
    case valueBounds(lower: Double, upper: Double)
    case inputBounds(lower: Int, upper: Int)
    case minimumInput(length: Int)
    case exactlyInput(length: Int)
    case nonZero
    case amount
    case phone(mask: String)
    case with(pattern: String)
    
    public var validationHandler: (String?) -> Bool {
        switch self {
        case .address(let locale, let completion):
            func addressValidation(perhapsText: String?) -> Bool
            {
                guard UserInputValidationType.isAddressValidationAvailable else {
                    completion(true)
                    return true
                }
                guard let text = perhapsText.nilIfEmpty else {
                    return false
                }
                /*
                 print("[\(type(of: self)) \(#function)] text: \(text)")
                 */
                let geocoder = CLGeocoder()
                if #available(iOS 11.0, *) {
                    geocoder.geocodeAddressString(text, in: nil, preferredLocale: locale) { (placemarks, error) in
                        /*
                         print("[\(type(of: self)) \(#function)] placemarks: \(placemarks) error: \(error)")
                         */
                        if let error = error as NSError?, placemarks == nil, error.code == 2 {
                            completion(true)
                            return
                        }
                        if
                            error == nil,
                            let placemarks = placemarks,
                            let _ = placemarks.first
                        {
                            /*
                             print("[\(type(of: self)) \(#function)] number: \(number)")
                             */
                            completion(true)
                        } else {
                            completion(false)
                        }
                    }
                } else {
                    // Fallback on earlier versions
                    completion(true)
                }
                return true
            }
            return addressValidation
        case .houseNumber(let locale, let completion):
            func houseNumberValidation(perhapsText: String?) -> Bool
            {
                guard UserInputValidationType.isAddressValidationAvailable else {
                    completion(true)
                    return true
                }
                guard let text = perhapsText.nilIfEmpty else {
                    return false
                }
                /*
                 print("[\(type(of: self)) \(#function)] text: \(text)")
                 */
                let geocoder = CLGeocoder()
                if #available(iOS 11.0, *) {
                    geocoder.geocodeAddressString(text, in: nil, preferredLocale: locale) { (placemarks, error) in
                        /*
                         print("[\(type(of: self)) \(#function)] placemarks: \(placemarks) error: \(error)")
                         */
                        if let error = error as NSError?, placemarks == nil, error.code == 2 {
                            completion(true)
                            return
                        }
                        if
                            error == nil,
                            let placemarks = placemarks,
                            let placemark = placemarks.first,
                            let number = placemark.subThoroughfare,
                            !number.isEmpty
                        {
                            /*
                             print("[\(type(of: self)) \(#function)] number: \(number)")
                             */
                            completion(true)
                        } else {
                            completion(false)
                        }
                    }
                } else {
                    // Fallback on earlier versions
                    completion(true)
                }
                return true
            }
            return houseNumberValidation
        case .city(let locale, let completion):
            func cityValidation(perhapsText: String?) -> Bool
            {
                guard UserInputValidationType.isAddressValidationAvailable else {
                    completion(true, nil)
                    return true
                }
                guard let text = perhapsText.nilIfEmpty else {
                    return false
                }
                /*
                 print("[\(type(of: self)) \(#function)] text: \(text)")
                 */
                let geocoder = CLGeocoder()
                if #available(iOS 11.0, *) {
                    geocoder.geocodeAddressString(text, in: nil, preferredLocale: locale) { (placemarks, error) in
                        /*
                         print("[\(type(of: self)) \(#function)] placemarks: \(placemarks) error: \(error)")
                         */
                        if let error = error as NSError?, placemarks == nil, error.code == 2 {
                            completion(true, nil)
                            return
                        }
                        if
                            error == nil,
                            let placemarks = placemarks,
                            let placemark = placemarks.first,
                            let city = placemark.locality,
                            !city.isEmpty/*,
                             text.contains(city)*/
                        {
                            //                        print("[\(type(of: self)) \(#function)] city: \(city)")
                            completion(true, placemarks)
                        } else {
                            completion(false, nil)
                        }
                    }
                } else {
                    // Fallback on earlier versions
                    completion(true, nil)
                }
                return true
            }
            return cityValidation
        case .street(let locale, let completion):
            func streetValidation(perhapsText: String?) -> Bool
            {
                guard UserInputValidationType.isAddressValidationAvailable else {
                    completion(true, nil)
                    return true
                }
                guard let text = perhapsText.nilIfEmpty else {
                    return false
                }
                /*
                 print("[\(type(of: self)) \(#function)] text: \(text)")
                 */
                let geocoder = CLGeocoder()
                if #available(iOS 11.0, *) {
                    geocoder.geocodeAddressString(text, in: nil, preferredLocale: locale) { (placemarks, error) in
                        /*
                         print("[\(type(of: self)) \(#function)] placemarks: \(placemarks) error: \(error)")
                         */
                        if let error = error as NSError?, placemarks == nil, error.code == 2 {
                            completion(true, nil)
                            return
                        }
                        if
                            error == nil,
                            let placemarks = placemarks,
                            let placemark = placemarks.first,
                            let street = placemark.thoroughfare,
                            !street.isEmpty/*,
                             text.contains(street)*/
                        {
                            /*
                             print("[\(type(of: self)) \(#function)] street: \(street)")
                             */
                            completion(true, street)
                        } else {
                            completion(false, nil)
                        }
                    }
                } else {
                    // Fallback on earlier versions
                    completion(true, nil)
                }
                return true
            }
            return streetValidation
        case .server:
            func serverStringValidation(perhapsText: String?) -> Bool
            {
                return true
            }
            return serverStringValidation
        case .nonZero:
            func nonZeroStringValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let validString = text.replacingOccurrences(of: ",", with: ".")
                let value = (validString as NSString).doubleValue
                if value <= 0.0 {
                    return false
                }
                return true
            }
            return nonZeroStringValidation
        case .emptyString:
            func emptyStringValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                return !trimmedText.isEmpty
            }
            return emptyStringValidation
        case .email:
            func emailValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let regexp = "[A-Z0-9a-z._-]+@([\\w\\d]+[\\.\\w\\d]*)"
                return text.evaluate(with: regexp)
            }
            return emailValidation
        case .numbersOnly:
            func numbersOnlyValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let regexp = "^[0-9]{1,}$"
                return text.evaluate(with: regexp)
            }
            return numbersOnlyValidation
        case .decimalsOnly:
            func decimalsOnlyValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let regexp = "^\\d*(\\.\\d*)?$"
                return text.evaluate(with: regexp)
            }
            return decimalsOnlyValidation
        case .minValue(let minValue):
            func minValueValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                guard let value = formatter.number(from: trimmedText)?.intValue else { return false }
                
                if value >= minValue {
                    return true
                } else {
                    return false
                }
            }
            return minValueValidation
        case .valueBounds(let lower, let upper):
            func minValueValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                guard let value = formatter.number(from: trimmedText)?.doubleValue else { return false }
                
                if value >= lower && value <= upper {
                    return true
                } else {
                    return false
                }
            }
            return minValueValidation
        case .inputBounds(let lower, let upper):
            func inputBoundsValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                if trimmedText.count >= lower && trimmedText.count <= upper {
                    return true
                } else {
                    return false
                }
            }
            return inputBoundsValidation
        case .minimumInput(let length):
            func minimumInputValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                if trimmedText.count >= length {
                    return true
                } else {
                    return false
                }
            }
            return minimumInputValidation
        case .exactlyInput(let length):
            func exactlyInputValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let trimmedText = text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                if trimmedText.count == length {
                    return true
                } else {
                    return false
                }
            }
            return exactlyInputValidation
        case .amount:
            func amountValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                
                guard text.isValidDouble(withDecimalPlaces: 2) else {
                    return false
                }
                return true
            }
            return amountValidation
        case .phone(let mask):
            func phoneValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                let mask: Mask = try! Mask(format: mask)
                let input: String = text
                let result: Mask.Result = mask.apply(
                    toText: CaretString(
                        string: input,
                        caretPosition: input.endIndex
                    ),
                    autocomplete: false
                )
                return result.complete
            }
            return phoneValidation
        case .with(let pattern):
            func withPatternValidation(perhapsText: String?) -> Bool
            {
                guard let text = perhapsText else {
                    return false
                }
                return text.evaluate(with: pattern)
            }
            return withPatternValidation
        }
    }
    static fileprivate var systemLanguageCode: String? {
        get {
            /*
             guard let languageCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String else {
             return nil
             }
             */
            guard let languageCode = NSLocale.current.languageCode else {
                return nil
            }
            return languageCode.uppercased()
        }
    }
    static public var isAddressValidationAvailable: Bool {
        get {
            /*
             guard let languageCode = self.systemLanguageCode else {
             return false
             }
             */
            if #available(iOS 11.0, *) {
                return true
            } else {
                return false
                /*
                 if (languageCode != "DE" && languageCode != "EN") {
                 return false
                 }
                 */
            }
        }
    }
}
