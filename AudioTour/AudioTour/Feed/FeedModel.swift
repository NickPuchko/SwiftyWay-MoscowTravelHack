//
//  FeedModel.swift
//  AudioTour
//
//  Created by Николай Пучко on 27.03.2021.
//

import Foundation

class FeedModel {
    
    weak var feedViewController: FeedViewController!
    lazy var networkManager = NetworkManager()
    
    init(feedViewController: FeedViewController) {
        self.feedViewController = feedViewController
    }
    
    var tours: [Tour] = []
    
    func loadTours(in city: String) {
        networkManager.getTours(city: "Мурманск") { [unowned self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                self.tours = []
            case .success(let tours):
                self.tours = tours
            }
            DispatchQueue.main.async {
                self.feedViewController.feedView.toursTableView.reloadData()
            }
        }
    }
}
 
