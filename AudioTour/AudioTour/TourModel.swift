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
    let route: [(latitude: Double, longitude: Double)]
    let bounds: BoundsRectangle
    
    init(title: String, childrenCount: Int, type: WelcomeType, category: Category,
         duration: Int?, distance: Int?, route: String, bounds: String) {
        
        self.title = title
        self.childrenCount = childrenCount
        self.type = type
        self.category = category
        self.duration = duration ?? 0
        self.distance = distance ?? 0
        self.route = Tour.stringToTupleDoubleArray(string: route)
        let boundsArray = bounds.split(separator: ",").map {Double($0.trimmingCharacters(in: .whitespaces)) ?? 0.0 }
        self.bounds = BoundsRectangle(startPoint: (boundsArray[0], boundsArray[1]),
                                      endPoint: (boundsArray[2], boundsArray[3]))
    }
    
    static func stringToTupleDoubleArray(string: String) -> [(latitude: Double, longitude: Double)] {
        
        let arrayOfStrings: [String] = string.split(separator: ";").map {String($0)}
        let tupleArray: [(latitude: Double, longitude: Double)] = arrayOfStrings.map { boundsString in
            let boundsArray: [String] = boundsString.split(separator: ",").map {String($0.trimmingCharacters(in: .whitespaces))}
            let resultTuple = (Double(boundsArray[0]) ?? 0.0, Double(boundsArray[1]) ?? 0.0)
            return resultTuple
        }
        return tupleArray
    }
    
}

struct BoundsRectangle {
    let startPoint: (latitude: Double, longitude: Double)
    let endPoint: (latitude: Double, longitude: Double)
}
