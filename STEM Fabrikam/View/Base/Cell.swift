//
//  Cell.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeViews()
        customizeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViews(){
        backgroundColor = .white
    }
    
    func customizeUI(){}
}
