//
//  StringExtension.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import Foundation

public extension String
{
    public static func className(_ aClass: AnyClass) -> String
    {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    public func sliceByCharacter(from: Character, to: Character) -> String?
    {
        let fromIndex = self.index(self.index(of: from)!, offsetBy: 1)
        let toIndex = self.index(self.index(of: to)!, offsetBy: -1)
        return String(self[fromIndex...toIndex])
    }
    
    public func sliceByString(from:String, to:String) -> String?
    {
        var range = self.range(of: from)
        let subString = String(self[range!.upperBound...])
        
        range = subString.range(of: to)
        return String(subString[..<range!.lowerBound])
    }
    
    public func substring(to: Int) -> String
    {
        let subIndex = self.index(self.startIndex, offsetBy: to)
        return String(describing: self[..<subIndex])
    }
    
    public func substring(_ from: Int) -> String
    {
        let index = self.index(self.startIndex, offsetBy: from)
        return String(self[index...])
    }
    
    public var length: Int {
        return self.count
    }
    
    public var withoutSpaces: String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    public func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat
    {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height
    }
    
    public var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
    
    public var cleanedString: String {
        var cleanedString = self.replacingOccurrences(of: "\"", with: "")
        cleanedString = cleanedString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return cleanedString
    }
    
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    public var isValidURL: Bool {
        if self.contains("http://") {
            return true
        }
        
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.endIndex.encodedOffset)) {
            return match.range.length == self.endIndex.encodedOffset
        } else {
            return false
        }
    }
}
