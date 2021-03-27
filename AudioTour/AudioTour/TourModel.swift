//
//  TourModel.swift
//  AudioTour
//
//  Created by Иван Лизогуб on 27.03.2021.
//

import Foundation

struct Tour {
    let title: String
    let childrenCount: Int
    let type: WelcomeType
    let category: Category
    let duration: Int
    let distance: Int
    let route: [[Double]]
    let bounds: [Double]
    
    init(title: String, childrenCount: Int, type: WelcomeType, category: Category,
         duration: Int?, distance: Int?, route: String, bounds: String) {
        
        self.title = title
        self.childrenCount = childrenCount
        self.type = type
        self.category = category
        self.duration = duration ?? 0
        self.distance = distance ?? 0
        self.route = route.split {$0 == ";"}.map {$0.split {$0 == ","}}
    }
}
