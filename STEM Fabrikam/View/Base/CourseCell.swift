//
//  CourseCell.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class CourseCell: Cell {
    var course: Course!
    weak var rootView: UIViewController!
    lazy var courseView = UIImageView()
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
        
        addSubview(courseView)
        courseView.layout {
            $0.top == topAnchor
            $0.bottom == bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
        }
        
        courseView.addSubview(shadowView)
        shadowView.layout {
            $0.bottom == courseView.bottomAnchor
            $0.leading == courseView.leadingAnchor
            $0.trailing == courseView.trailingAnchor
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
    
    func setCell(for course: Course) {
        titleLabel.text = course.title
        courseView.image = UIImage(named: course.image)
    }
    
    func goToCourse() {
        rootView.navigationController?.pushViewController(CourseDetailsVC(), animated: true)
    }
}

private extension CourseCell {
    private func makePretty(){
        courseView.layer.borderWidth = 0.5
        courseView.layer.shadowRadius = 2.0
        courseView.layer.shadowOpacity = 0.5
        courseView.layer.masksToBounds = false
        courseView.contentMode = .scaleAspectFit
        courseView.layer.shadowColor = UIColor.black.cgColor
        courseView.layer.borderColor = UIColor.lightGray.cgColor
        courseView.layer.shadowOffset = CGSize(width: 0, height: 3.5)
    }
}
