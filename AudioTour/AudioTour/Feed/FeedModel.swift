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
            Tour(title: "Tour 1", childrenCount: 10, type: .tour, category: .walk, duration: 3600, distance: 1000, route: "228,228", bounds: "228,228"),
            Tour(title: "Tour 1", childrenCount: 10, type: .tour, category: .walk, duration: 3600, distance: 1000, route: "228,228", bounds: "228,228")
        ]
        feedViewController.feedView.toursTableView.reloadData()
    }
}
