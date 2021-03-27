//
//  FeedModel.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import Foundation

class FeedModel {
    weak var feedViewController: FeedViewController!
    var tours: [Tour] = []
    
    init(vc: FeedViewController) {
        feedViewController = vc
    }
    
    func loadTours() {
        
    }
}
