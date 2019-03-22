//
//  AppDelegate.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 22.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var homeVC: HomeVC = {
        let vc = HomeVC()
        vc.tabBarItem = UITabBarItem.init(title: "Ana Sayfa", image: UIImage(named: "homePassive"), selectedImage: UIImage(named: "homeActive"))
        return vc
    }()
    lazy var myCoursesVC: MyCoursesVC = {
        let vc = MyCoursesVC()
        vc.tabBarItem = UITabBarItem.init(title: "Kurslarım", image: UIImage(named: "myCoursesPassive"), selectedImage: UIImage(named: "myCoursesActive"))
        return vc
    }()
    lazy var profileVC: ProfileVC = {
        let vc = ProfileVC()
        vc.tabBarItem = UITabBarItem.init(title: "Profilim", image: UIImage(named: "menu"), selectedImage: UIImage(named: "menu"))
        return vc
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.rootViewController = initTabBarController()
            window.makeKeyAndVisible()
        }
        return true
    }
    
    func initTabBarController() -> UITabBarController{
        let viewControllers: [UIViewController] = {
            return [homeVC, myCoursesVC, profileVC]
        }()

        let tabBarController: UITabBarController = {
            let controller = UITabBarController()
            controller.tabBar.barTintColor = .red
            controller.tabBar.tintColor = .white
            controller.tabBar.unselectedItemTintColor = UIColor(white: 1, alpha: 0.5)
            controller.tabBar.isTranslucent = false
            controller.viewControllers = viewControllers.map { UINavigationController(rootViewController: $0) }
            return controller
        }()
        return tabBarController
    }
    


}

