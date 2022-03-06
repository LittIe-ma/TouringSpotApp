//
//  Router.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/06.
//

import UIKit

final class Router {
    
    static let shared: Router = .init()
    private init() {}

    private var window: UIWindow?

    func showRoot(window: UIWindow?) {
        let vc = TouringSpotListViewController.makeFromStoryboard()
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        self.window = window
    }
}
