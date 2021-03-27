//
//  AppDelegate.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootVC = FeedViewController()
        let navVC = MainNavigationController(rootViewController: rootVC)
        let window = UIWindow()
        window.rootViewController = navVC
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}

