//
//  CourseDetailsVC.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 23.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class CourseDetailsVC: ViewController<CourseDetailsViews> {
    var course: Course!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.rootView = self
        setCourseImage()
        fillLessonsArray()
    }
}

private extension CourseDetailsVC {
    private func setCourseImage(){
        customView.courseImage.contentMode = .scaleAspectFit
        customView.courseImage.image = UIImage(named: course.image)
    }
    
    private func fillLessonsArray(){
        customView.lessons = course.lessons
        customView.collectionView.reloadData()
    }
}
