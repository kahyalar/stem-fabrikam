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
//    lazy var homeVC: BasketVC = {
//        var vc: BasketVC?
//        vc = checkPremium() ? BasketVC(premium: true) : BasketVC(premium: false)
//        vc!.tabBarItem = UITabBarItem.init(title: "My Basket", image: #imageLiteral(resourceName: "TabBar-Basket-Unclicked"), selectedImage: #imageLiteral(resourceName: "TabBar-Basket"))
//        return vc!
//    }()
//    lazy var statisticsVC: StatisticsVC = {
//        var vc: StatisticsVC?
//        vc = checkPremium() ? StatisticsVC(premium: true) : StatisticsVC(premium: false)
//        vc!.tabBarItem = UITabBarItem.init(title: "Statistics", image: #imageLiteral(resourceName: "TabBar-Stats-Unclicked"), selectedImage: #imageLiteral(resourceName: "TabBar-Stats"))
//        return vc!
//    }()
//    lazy var premiumVC: UIViewController = {
//        var vc: UIViewController?
//        vc = checkPremium() ? PremiumFeaturesVC() : BuyPremiumVC()
//        vc!.tabBarItem = UITabBarItem.init(title: "Premium", image: #imageLiteral(resourceName: "TabBar-Favorites-Unclicked"), selectedImage: #imageLiteral(resourceName: "TabBar-Favorites"))
//        return vc!
//    }()

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
            return [UIViewController(), UIViewController(), UIViewController()]
        }()

        let tabBarController: UITabBarController = {
            let controller = UITabBarController()
            controller.tabBar.isTranslucent = false
//            controller.tabBar.tintColor = .estonianBlue
            controller.viewControllers = viewControllers.map { UINavigationController(rootViewController: $0) }
            return controller
        }()
        return tabBarController
    }
    


}

