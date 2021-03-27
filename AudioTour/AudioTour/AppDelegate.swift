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
        let tour = TourViewModel(title: "SOmeTitle", childrenCount: 20, type: .tour,
                        category: .walk, duration: 1000, distance: 20,
                        route: "20.0, 30.0", bounds: "59.7452159,30.090332,60.089675,30.559783")
        let rootVC = TourMapViewController(tour: tour)
        let navVC = MainNavigationController(rootViewController: rootVC)
        let window = UIWindow()
        window.rootViewController = navVC
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}
