//
//  LayoutDimension.swift
//
//  Created by Batuhan Saka on 5.11.2018.
//  Copyright © 2018 Batuhan Saka. All rights reserved.
//

import UIKit

public protocol LayoutDimension {
    func constraint(equalToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(equalTo: Self,
                    multiplier: CGFloat,
                    constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo: Self,
                    multiplier: CGFloat,
                    constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo: Self,
                    multiplier: CGFloat,
                    constant: CGFloat) -> NSLayoutConstraint
}

@available(iOS 9.0, *)
extension NSLayoutDimension: LayoutDimension {}

public func ==<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}

public func *<A: LayoutDimension>(lhs: A, rhs: CGFloat) -> (A, CGFloat, CGFloat) {
    return (lhs, rhs, 0)
}

public func +<A: LayoutDimension>(lhs: (A, CGFloat, CGFloat), rhs: CGFloat) -> (A, CGFloat, CGFloat) {
    return (lhs.0, lhs.1, rhs)
}

public func -<A: LayoutDimension>(lhs: (A, CGFloat, CGFloat), rhs: CGFloat) -> (A, CGFloat, CGFloat) {
    return (lhs.0, lhs.1, -rhs)
}

public func >=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.greaterThanOrEqual(to: rhs)
}

public func <=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: CGFloat) {
    lhs.lessThanOrEqual(to: rhs)
}

public func ==<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat, CGFloat)) {
    lhs.equal(to: rhs.0, multiplier: rhs.1, constant: rhs.2)
}

public func >=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, multiplier: rhs.1, constant: rhs.2)
}

public func <=<A: LayoutDimension>(lhs: LayoutProperty<A>, rhs: (A, CGFloat, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, multiplier: rhs.1, constant: rhs.2)
}

