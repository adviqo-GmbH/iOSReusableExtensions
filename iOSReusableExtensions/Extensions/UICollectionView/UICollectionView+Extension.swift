//
//  UICollectionView+Extension.swift
//  ReusableExtensions
//
//  Created by Oleksandr Pronin on 14.01.19.
//  Copyright © 2019 adviqo. All rights reserved.
//

import UIKit

@objc public extension UICollectionView {
    func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    static var reuseIdentifier: String {
        return String.className(Self.self)
    }
    func scrollToTopLeft(animated: Bool) {
        self.setContentOffset(CGPoint.zero, animated: animated)
    }
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
}
public extension UICollectionView {
    func dequeueCell<CellType: UICollectionViewCell>(for indexPath: IndexPath) -> CellType {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: CellType.reuseIdentifier,
            for: indexPath) as? CellType
        else {
            fatalError("Wrong type of cell in collectionView")
        }
        return cell
    }
}
public extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String.className(Self.self)
    }
}
