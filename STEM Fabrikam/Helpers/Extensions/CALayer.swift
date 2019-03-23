//
//  CALayer.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

extension CALayer{
    
    func applyShadow(color: UIColor = UIColor.black, alpha: Float = 0.16, x: CGFloat = 0, y: CGFloat = 4, radius: CGFloat = 6){
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = radius
    }
    
}
