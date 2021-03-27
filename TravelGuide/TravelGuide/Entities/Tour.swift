//
//  Tour.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import Foundation

struct Tour: Codable {
    let uuid, title: String
    let category: Category?
    let duration: Int?
    let location: Location?
    let images: [Image]?
    let reviews: Reviews?
}

struct Location: Codable {
    let latitude, longitude: Double
}

struct Reviews: Codable {
    let ratingAverage, ratingsCount, reviewsCount: Double
}

struct Image: Codable {
    let uuid: String?
    let size: Int?
}

enum Category: String, Codable {
    case walk, bike, bus, car, boat, running, train, horseriding
}
