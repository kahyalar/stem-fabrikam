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
    
    override func handleNavigationController(for controller: UIViewController) {
        super.handleNavigationController(for: self)
    }
}
