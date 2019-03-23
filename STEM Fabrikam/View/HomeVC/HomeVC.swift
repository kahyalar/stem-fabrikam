//
//  ViewController.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 22.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class HomeVC: ViewController<HomeViews> {
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.rootView = self
    }
}

