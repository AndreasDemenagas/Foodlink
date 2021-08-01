//
//  MainTabBarController.swift
//  Foodlink
//
//  Created by Andrew Demenagas on 1/8/21.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .systemRed
        tabBar.isTranslucent = false
        
        viewControllers = [
            navigationController(controller: FoodFeedController(), imageName: "cart", title: "Food"),
            navigationController(controller: UIViewController(), imageName: "bolt", title: "Drinks"),
            navigationController(controller: UIViewController(), imageName: "creditcard", title: "My order")
        ]
    }
    
    fileprivate func navigationController(controller: UIViewController, imageName: String, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)
        controller.navigationItem.title = title
        controller.tabBarItem.title = title
        controller.navigationController?.navigationBar.prefersLargeTitles = true
        controller.tabBarItem.image = UIImage(systemName: imageName)
        return navigationController
    }
}
