//
//  LogPrint.swift
//  iOSReusableExtensions
//
//  Created by Aleksei Neronov on 27.04.20.
//  Copyright © 2020 adviqo. All rights reserved.
//

import Foundation

public func logPrint( _ object: @autoclosure() -> Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG || TEST
    let value = object()
    let stringRepresentation: String
    if let value = value as? CustomDebugStringConvertible {
        stringRepresentation = value.debugDescription
    } else if let value = value as? CustomStringConvertible {
        stringRepresentation = value.description
    } else {
        stringRepresentation = "\(value)"
    }
    let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
    let queue = Thread.isMainThread ? "UI" : "BG"
    let gFormatter = DateFormatter()
    gFormatter.dateFormat = "HH:mm:ss:SSS"
    let timestamp = gFormatter.string(from: Date())
    Swift.print("✅ \(timestamp) {\(queue)} \(fileURL) > \(function)[\(line)]: " + stringRepresentation)
    #endif
}
public func errorPrint( _ object: @autoclosure() -> Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG || TEST
    let value = object()
    let stringRepresentation: String
    if let value = value as? CustomDebugStringConvertible {
        stringRepresentation = value.debugDescription
    } else if let value = value as? CustomStringConvertible {
        stringRepresentation = value.description
    } else {
        stringRepresentation = "\(value)"
    }
    let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
    let queue = Thread.isMainThread ? "UI" : "BG"
    let gFormatter = DateFormatter()
    gFormatter.dateFormat = "HH:mm:ss:SSS"
    let timestamp = gFormatter.string(from: Date())
    Swift.print("⚠️ \(timestamp) {\(queue)} \(fileURL) > \(function)[\(line)]: " + stringRepresentation)
    #endif
}
