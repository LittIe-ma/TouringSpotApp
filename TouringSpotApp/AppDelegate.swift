//
//  AppDelegate.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if #available(iOS 15.0, *) {
            let appearamce: UITabBarAppearance = UITabBarAppearance()
            UITabBar.appearance().scrollEdgeAppearance = appearamce
            UITabBar.appearance().standardAppearance = appearamce
        }

        if #available(iOS 15.0, *) {
            let appearance: UINavigationBarAppearance = UINavigationBarAppearance()
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().standardAppearance = appearance
        }

        Router.shared.showRoot(window: UIWindow(frame: UIScreen.main.bounds))
        
        return true
    }
}
