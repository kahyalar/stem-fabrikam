//
//  LayoutProxy.swift
//
//  Created by Batuhan Saka on 4.11.2018.
//  Copyright © 2018 Batuhan Saka. All rights reserved.
//

import UIKit

open class LayoutProxy {
    @available(iOS 9.0, *)
    open lazy var leading = property(with: view.leadingAnchor)
    
    @available(iOS 9.0, *)
    open lazy var trailing = property(with: view.trailingAnchor)
    
    @available(iOS 9.0, *)
    open lazy var top = property(with: view.topAnchor)
    
    @available(iOS 9.0, *)
    open lazy var bottom = property(with: view.bottomAnchor)
    
    @available(iOS 9.0, *)
    open lazy var width = property(with: view.widthAnchor)
    
    @available(iOS 9.0, *)
    open lazy var height = property(with: view.heightAnchor)
    
    @available(iOS 9.0, *)
    open lazy var centerX = property(with: view.centerXAnchor)
    
    @available(iOS 9.0, *)
    open lazy var centerY = property(with: view.centerYAnchor)
    
    private let view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    private func property<A: LayoutAnchor>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
    
}
