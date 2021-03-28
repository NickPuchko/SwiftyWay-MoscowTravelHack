//
//  Route.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import Foundation

struct Route: Codable {
    let uuid: String
    let content: [Content]
    let map: Map
}

struct Content: Codable {
    let audio: [Audio]?
    let images: [Image]
    let desc: String
}

struct Audio: Codable {
    let uuid: String
    let duration: Int?
    let order: Int
}

struct Map: Codable {
    let bounds: String
    let route: String?
}
