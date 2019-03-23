//
//  CourseDetailsVC+Views.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class CourseDetailsViews: View {
    var lessons: [Lesson] = []
    weak var rootView: CourseDetailsVC!
    lazy var courseImage = UIImageView()
    lazy var collectionView = UICollectionView(orientation: .vertical)
    
    override func layoutViews() {
        super.layoutViews()
        prepareCollectionViews()
        
        addSubview(courseImage)
        courseImage.layout {
            $0.top == safeTopAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.height == UIScreen.main.bounds.height * 0.25
        }
        
        addSubview(collectionView)
        collectionView.layout {
            $0.top == courseImage.bottomAnchor
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.height == UIScreen.main.bounds.height * 0.75
        }
    }
    
    fileprivate func prepareCollectionViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LessonCell.self, forCellWithReuseIdentifier: "cellId")
    }
}

extension CourseDetailsViews: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lessons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! LessonCell
        cell.rootView = rootView
        cell.setCell(for: lessons[indexPath.row], with: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.95, height: (UIScreen.main.bounds.height * 0.75) * 0.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: UIScreen.main.bounds.width * 0.025, left: UIScreen.main.bounds.width * 0.025 , bottom: UIScreen.main.bounds.width * 0.025, right: UIScreen.main.bounds.width * 0.025)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return UIScreen.main.bounds.width * 0.01 }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! LessonCell
        cell.goToLesson()
    }
}

