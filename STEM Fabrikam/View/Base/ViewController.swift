//
//  ViewController.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 22.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

class ViewController<V: View>: UIViewController {
    override func loadView() {
        view = V()
    }
    
    var customView: V {
        return view as! V
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleNavigationController(for: self)
    }
    
    func handleNavigationController(for controller: UIViewController) {
        navigationController?.view.backgroundColor = .red
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        switch controller {
        case is HomeVC:
            navigationController?.visibleViewController?.navigationItem.title = "Anasayfa"
        case is MyCoursesVC:
            navigationController?.visibleViewController?.navigationItem.title = "Kurslarım"
        case is ProfileVC:
            navigationController?.visibleViewController?.navigationItem.title = "Profilim"
        default:
            navigationController?.visibleViewController?.navigationItem.title = ""
        }
    }
    
    
}
