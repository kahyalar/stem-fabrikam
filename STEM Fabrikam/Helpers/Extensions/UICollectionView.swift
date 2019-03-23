//
//  UICollectionView.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

extension UICollectionView {
    convenience init(orientation: UICollectionView.ScrollDirection) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = orientation
        self.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = .white
        self.isScrollEnabled = true
    }
}
