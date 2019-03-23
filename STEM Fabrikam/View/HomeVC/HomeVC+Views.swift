//
//  HomeVC+Views.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 22.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit
import PDFKit

class HomeViews: View {
    weak var rootView: HomeVC!
    let courses: [Course] = DataService.shared.getCourses()
    lazy var collectionView = UICollectionView(orientation: .vertical)
    lazy var coursesLabel: UILabel = {
        let label = UILabel()
        label.text = "Eğitimler"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    override func layoutViews() {
        super.layoutViews()
        prepareCollectionViews()
        
        addSubview(coursesLabel)
        coursesLabel.layout {
            $0.top == safeTopAnchor + UIScreen.main.bounds.width * 0.1
            $0.leading == leadingAnchor + UIScreen.main.bounds.width * 0.1
        }
        
        addSubview(collectionView)
        collectionView.layout {
            $0.top == coursesLabel.bottomAnchor
            $0.bottom == bottomAnchor - UIScreen.main.bounds.width * 0.05
            $0.leading == leadingAnchor + UIScreen.main.bounds.width * 0.05
            $0.trailing == trailingAnchor - UIScreen.main.bounds.width * 0.05
        }
    }
    
    fileprivate func prepareCollectionViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CourseCell.self, forCellWithReuseIdentifier: "cellId")
    }
}

extension HomeViews: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CourseCell
        cell.rootView = rootView
        cell.setCell(for: courses[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width * 0.025 , bottom: 0, right: UIScreen.main.bounds.width * 0.025)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { return UIScreen.main.bounds.width * 0.05 }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CourseCell
        cell.goToCourse()
    }
    
    
}
