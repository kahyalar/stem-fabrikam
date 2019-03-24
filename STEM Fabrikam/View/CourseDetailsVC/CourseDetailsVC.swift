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
        addSaveToMyCoursesButton()
        setCourseImage()
        fillLessonsArray()
    }
    
    @objc func saveToMyCourses(){
        navigationItem.rightBarButtonItem?.isEnabled = false
        DataService.shared.saveCourseId(id: course.id)
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
    
    private func addSaveToMyCoursesButton(){
        var isEnabled: Bool!
        let courses = DataService.shared.getEnrolledCourses()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(saveToMyCourses))
        if courses.isEmpty{
            isEnabled = true
        } else {
            for c in courses {
                isEnabled = c.id == course.id ? false : true
            }
        }
        navigationItem.rightBarButtonItem?.isEnabled = isEnabled
    }
}
