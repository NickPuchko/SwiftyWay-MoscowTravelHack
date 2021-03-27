//
//  AppDelegate.swift
//  AudioTour
//
//  Created by Administrator on 26.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let rootVC = FeedViewController(nibName: nil, bundle: nil)
        let navVC = MainNavigationController(rootViewController: rootVC)
        let window = UIWindow()
        window.rootViewController = navVC
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}
