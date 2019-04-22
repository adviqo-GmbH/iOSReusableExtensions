//
//  Sequence+Perform.swift
//  iOSReusableExtensions
//
//  Created by Oleksandr Pronin on 22.04.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

/*
    Injecting side effects into chained Sequence operations
    https://oleb.net/blog/2017/10/chained-foreach/
*/

import Foundation

public extension Sequence
{
    /// Perform a side effect for each element in `self`.
    @discardableResult
    func forEachPerform(_ body: (Element) throws -> ())
        rethrows -> Self
    {
        try forEach(body)
        return self
    }
}

public extension Sequence
{
    /// Perform a side effect.
    @discardableResult
    func perform(_ body: (Self) throws -> ())
        rethrows -> Self
    {
        try body(self)
        return self
    }
}

public struct LazyForEachIterator<Base: IteratorProtocol> : IteratorProtocol
{
    public mutating func next() -> Base.Element? {
        guard let nextElement = base.next() else {
            return nil
        }
        perform(nextElement)
        return nextElement
    }
    var base: Base
    let perform: (Base.Element) -> ()
}

public struct LazyForEachSequence<Base: Sequence> : LazySequenceProtocol
{
    public func makeIterator()
        -> LazyForEachIterator<Base.Iterator>
    {
        return LazyForEachIterator(
            base: base.makeIterator(),
            perform: perform)
    }
    let base: Base
    let perform: (Base.Element) -> ()
}

public extension LazySequenceProtocol
{
    func forEachPerform(_ body: @escaping (Element) -> ()) -> LazyForEachSequence<Self>
    {
        return LazyForEachSequence(base: self, perform: body)
    }
}
