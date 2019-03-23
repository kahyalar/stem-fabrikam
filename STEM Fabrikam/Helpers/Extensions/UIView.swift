//
//  UIView+Extension.swift
//
//  Created by Batuhan Saka on 5.11.2018.
//  Copyright © 2018 Batuhan Saka. All rights reserved.
//

import UIKit

extension UIView {
    public var height: CGFloat {
        get { return frame.size.height }
    }
    public var width: CGFloat {
        get { return frame.size.width }
    }
    
    func underlined(){
        let width = CGFloat(2.0)
        let border: CALayer = {
            let border = CALayer()
            border.borderColor = UIColor.black.cgColor
            border.frame = CGRect(x: 0, y: self.height - width, width: self.width, height: self.height)
            border.borderWidth = width
            return border
        }()
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
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
