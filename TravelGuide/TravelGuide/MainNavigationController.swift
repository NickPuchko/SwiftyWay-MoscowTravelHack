//
//  MainNavigationController.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}
