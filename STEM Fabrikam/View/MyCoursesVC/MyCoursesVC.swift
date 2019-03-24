//
//  MyCoursesVC.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 22.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class MyCoursesVC: ViewController<MyCoursesViews> {
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.rootView = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshCourseList()
    }
}

private extension MyCoursesVC {
    private func refreshCourseList(){
        customView.courses = DataService.shared.getEnrolledCourses()
        customView.hideDefaultViews(isEmpty: customView.courses.isEmpty)
        customView.collectionView.reloadData()
    }
}
