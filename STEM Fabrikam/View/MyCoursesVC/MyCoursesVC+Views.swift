//
//  MyCoursesVC+Views.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class MyCoursesViews: View {
    fileprivate var courses = DataService.shared.getEnrolledCourses()
    lazy var noCourseView = UIView()
    lazy var noCourseLabel = createLabel(with: "Kurs bulunamadı!")
    lazy var collectionView = UICollectionView(orientation: .horizontal)
    lazy var noCourseImage = UIImageView(image: UIImage(named: "noCourse"))
    
    override func setViews() {
        super.setViews()
        hideDefaultViews(isEmpty: courses.isEmpty)
    }
    
    
    override func layoutSubviews() {
        super.layoutViews()
        prepareCollectionViews()
        
        addSubview(collectionView)
        collectionView.layout {
            $0.top == safeTopAnchor
            $0.bottom == bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
        }
        
        addSubview(noCourseView)
        noCourseView.layout {
            $0.top == safeTopAnchor
            $0.bottom == bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
        }
        
        noCourseView.addSubview(noCourseImage)
        noCourseImage.layout {
            $0.centerX == centerXAnchor
            $0.centerY == centerYAnchor + UIScreen.main.bounds.height * 0.1
            $0.width == UIScreen.main.bounds.height * 0.4
            $0.height == UIScreen.main.bounds.height * 0.4
            noCourseImage.contentMode = .scaleAspectFill
        }
        
        noCourseView.addSubview(noCourseLabel)
        noCourseLabel.layout {
            $0.centerX == centerXAnchor
            $0.top == noCourseView.topAnchor + UIScreen.main.bounds.height * 0.2
        }
    }
    
    fileprivate func prepareCollectionViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CourseCell.self, forCellWithReuseIdentifier: "cellId")
    }
}

extension MyCoursesViews: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CourseCell
        cell.titleLabel.text = courses[indexPath.row].title
        cell.courseButton.setBackgroundImage(UIImage(named: courses[indexPath.row].image), for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.width * 0.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: UIScreen.main.bounds.width * 0.025, left: UIScreen.main.bounds.width * 0.025 , bottom: UIScreen.main.bounds.width * 0.025, right: UIScreen.main.bounds.width * 0.025)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return UIScreen.main.bounds.width * 0.05 }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

private extension MyCoursesViews {
    private func createLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        return label
    }
    
    private func hideDefaultViews(isEmpty: Bool) {
        noCourseView.isHidden = isEmpty ? false : true
    }
}
