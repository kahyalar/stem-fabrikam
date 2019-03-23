//
//  CourseCell.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class CourseCell: Cell {
    lazy var courseButton = UIButton()
    lazy var shadowView = UIView()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label

    }()
    
    override func initializeViews() {
        super.initializeViews()
        
        addSubview(courseButton)
        courseButton.layout {
            $0.top == topAnchor
            $0.bottom == bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
        }
        
        courseButton.addSubview(shadowView)
        shadowView.layout {
            $0.bottom == courseButton.bottomAnchor
            $0.leading == courseButton.leadingAnchor
            $0.trailing == courseButton.trailingAnchor
            $0.height == (UIScreen.main.bounds.width * 0.4) * 0.4
            shadowView.backgroundColor = UIColor(white: 0, alpha: 0.6)
        }
        
        shadowView.addSubview(titleLabel)
        titleLabel.layout {
            $0.centerX == shadowView.centerXAnchor
            $0.centerY == shadowView.centerYAnchor
            $0.width == (UIScreen.main.bounds.width * 0.4) * 0.9
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        makePretty()
    }
}

private extension CourseCell {
    private func makePretty(){
        courseButton.layer.borderWidth = 0.5
        courseButton.layer.shadowRadius = 2.0
        courseButton.layer.shadowOpacity = 0.5
        courseButton.layer.masksToBounds = false
        courseButton.layer.shadowColor = UIColor.black.cgColor
        courseButton.layer.borderColor = UIColor.lightGray.cgColor
        courseButton.subviews.first?.contentMode = .scaleAspectFit
        courseButton.layer.shadowOffset = CGSize(width: 0, height: 3.5)
    }
}
