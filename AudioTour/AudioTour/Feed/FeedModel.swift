//
//  FeedModel.swift
//  AudioTour
//
//  Created by Николай Пучко on 27.03.2021.
//

import Foundation

class FeedModel {
    
    weak var feedViewController: FeedViewController!
    
    init(feedViewController: FeedViewController) {
        self.feedViewController = feedViewController
    }
    
    var tours: [Tour] = []
    
    func loadTours(in city: String) {
        tours = [
            
        ]
        feedViewController.feedView.toursTableView.reloadData()
    }
}
