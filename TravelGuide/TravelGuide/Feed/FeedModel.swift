//
//  FeedModel.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import Foundation

class FeedModel {
    weak var feedViewController: FeedViewController!
    
    init(vc: FeedViewController) {
        feedViewController = vc
    }
}
