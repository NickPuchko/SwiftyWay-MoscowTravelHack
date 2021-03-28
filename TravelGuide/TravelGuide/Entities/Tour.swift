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
    let contentProvider: ContentProvider
    let type: Type
}

struct Location: Codable {
    let latitude, longitude: Double
}

struct Reviews: Codable {
    let ratingAverage, ratingsCount, reviewsCount: Double
}

struct Image: Codable {
    let uuid: String?
}

struct ContentProvider: Codable {
    let uuid, name: String
}

enum Type: String, Codable {
    case tour, museum
}

enum Category: String, Codable {
    case walk, bike, bus, car, boat, running, train, horseriding
}
