//
//  UIView+Extension.swift
//
//  Created by Batuhan Saka on 5.11.2018.
//  Copyright © 2018 Batuhan Saka. All rights reserved.
//

import UIKit

extension UIView {
    
    @available(iOS 9.0, *)
    open var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    @available(iOS 9.0, *)
    open var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }

    open func layout(using closure: (LayoutProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutProxy(view: self))
    }
    
    open func fillSuperview() {
        guard let superview = superview else { return }
        self.layout {
            if #available(iOS 9.0, *) {
                $0.top == superview.topAnchor
                $0.leading == superview.leadingAnchor
                $0.bottom == superview.bottomAnchor
                $0.trailing == superview.trailingAnchor
            }
        }
    }
    
}
