//
//  LayoutProperty.swift
//
//  Created by Batuhan Saka on 5.11.2018.
//  Copyright © 2018 Batuhan Saka. All rights reserved.
//

import UIKit

public struct LayoutProperty<Anchor> {
    let anchor: Anchor
}

extension LayoutProperty where Anchor: LayoutAnchor {
    
    func equal(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(equalTo: otherAnchor, constant: constant).isActive = true
    }
    
    func greaterThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: constant).isActive = true
    }
    
    func lessThanOrEqual(to otherAnchor: Anchor, offsetBy constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: constant).isActive = true
    }
}

extension LayoutProperty where Anchor: LayoutDimension {
    
    func equal(to constant: CGFloat) {
        anchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func greaterThanOrEqual(to constant: CGFloat) {
        anchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
    }
    
    func lessThanOrEqual(to constant: CGFloat) {
        anchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }
    
    func equal(to otherAnchor: Anchor, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        anchor.constraint(equalTo: otherAnchor, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func greaterThanOrEqual(to otherAnchor: Anchor, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        anchor.constraint(greaterThanOrEqualTo: otherAnchor, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func lessThanOrEqual(to otherAnchor: Anchor, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        anchor.constraint(lessThanOrEqualTo: otherAnchor, multiplier: multiplier, constant: constant).isActive = true
    }
}
