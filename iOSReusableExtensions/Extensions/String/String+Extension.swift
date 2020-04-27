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
    static func className(_ aClass: AnyClass) -> String
    {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func sliceByCharacter(from: Character, to: Character) -> String?
    {
        let fromIndex = self.index(self.firstIndex(of: from)!, offsetBy: 1)
        let toIndex = self.index(self.firstIndex(of: to)!, offsetBy: -1)
        return String(self[fromIndex...toIndex])
    }
    
    func sliceByString(from:String, to:String) -> String?
    {
        var range = self.range(of: from)
        let subString = String(self[range!.upperBound...])
        
        range = subString.range(of: to)
        return String(subString[..<range!.lowerBound])
    }
    
    func substring(to: Int) -> String
    {
        let subIndex = self.index(self.startIndex, offsetBy: to)
        return String(describing: self[..<subIndex])
    }
    
    func substring(_ from: Int) -> String
    {
        let index = self.index(self.startIndex, offsetBy: from)
        return String(self[index...])
    }
    
    var length: Int {
        return self.count
    }
    
    var withoutSpaces: String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat
    {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height
    }
    
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
    
    var cleanedString: String {
        var cleanedString = self.replacingOccurrences(of: "\"", with: "")
        cleanedString = cleanedString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return cleanedString
    }
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    var isValidURL: Bool {
        if self.contains("http://") {
            return true
        }
        
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}
