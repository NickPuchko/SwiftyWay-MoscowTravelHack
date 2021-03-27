//
//  FeedModel.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import Foundation

class FeedModel {
    weak var feedViewController: FeedViewController!
    var networkManager = ToursNetworkService()
    var tours: [Tour] = []
    
    init(vc: FeedViewController) {
        feedViewController = vc
    }
    
    func loadTours() {
        networkManager.getTours(city: "Мурманск") { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let tours):
                self.tours = tours
            }
        }
    }
}
