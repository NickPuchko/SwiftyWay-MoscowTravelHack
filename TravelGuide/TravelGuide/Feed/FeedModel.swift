//
//  FeedModel.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import Foundation
import UIKit

class FeedModel {
    weak var feedViewController: FeedViewController!
    var networkManager = ToursNetworkService()
    var imageManager = ImageNetworkService()
    var tours: [Tour] = []
    let images: [UIImage] = []
    
    let routeManager = RouteNetworkService()
    
    init(vc: FeedViewController) {
        feedViewController = vc
    }
    
    func loadTours() {
        networkManager.getTours(city: "Мурманск") { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let tours):
                self.tours = tours.filter { $0.category != nil }
                self.routeManager.getRoute(tourUuid: tours[0].uuid) { result in
//                    print(result)
                }
            }
        }
    }
}
