//
//  AppDelegate.swift
//  STEM Fabrikam
//
//  Created by Furkan Kahyalar on 22.03.2019.
//  Copyright © 2019 kahyalar. All rights reserved.
//

import UIKit
import PDFKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let course = Course(id: "1", title: "Elektronik Devre Elemanlarını Tanıyalım",
                        image: "Picture1",
                        playlist: "PLALXza7IgmyuItXM_LM5D4wuelX0hU6Z8",
                        lessons: [
                            Lesson(title: "Kapasitörleri tanıyalım", video: "https://firebasestorage.googleapis.com/v0/b/stem-fabrikasi.appspot.com/o/1.mp4?alt=media&token=9bc8b1e4-92f4-4e23-890f-e8d6bb838ee5", document: "1"),
                            Lesson(title: "Diyotları tanıyalım", video: "https://firebasestorage.googleapis.com/v0/b/stem-fabrikasi.appspot.com/o/2.mp4?alt=media&token=22e15002-93f7-49fa-a4cf-950a2c1c777f", document: "2")
                                 ])
    lazy var homeVC: HomeVC = {
        let vc = HomeVC()
        vc.tabBarItem = UITabBarItem.init(title: "Anasayfa", image: UIImage(named: "homePassive"), selectedImage: UIImage(named: "homeActive"))
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
        DataService.shared.saveCourse(course: course)
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.rootViewController = DataService.shared.isUserExists() ? initTabBarController() : LoginVC()
            window.makeKeyAndVisible()
        }
        return true
    }
    
    func initTabBarController() -> UITabBarController {
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

