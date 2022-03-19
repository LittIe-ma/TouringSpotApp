//
//  MainTabBarController.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/19.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var viewControllers = [UIViewController]()

        let touringSpotListVC = TouringSpotListViewController.makeFromStoryboard()
        touringSpotListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        viewControllers.append(touringSpotListVC)

        let mapVC = MapViewController.makeFromStoryboard()
        mapVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        viewControllers.append(mapVC)

        viewControllers = viewControllers.map{ UINavigationController(rootViewController: $0)}
        setViewControllers(viewControllers, animated: false)
    }
}
