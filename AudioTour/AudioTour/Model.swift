// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
import UIKit

// MARK: - WelcomeElement
struct Tour: Codable {
    let uuid: String
    let map: Map
    let childrenCount: Int
    let reviews: Reviews
    let images: [WelcomeImage]
    let location: WelcomeLocation
    let title: String
    let category: Category?
    let duration: Int?
    let distance: Int?
    let route: String?
}

enum Category: String, Codable {
    case car, walk 
}

// MARK: - Map
struct Map: Codable {
    let bounds: String
}

// MARK: - WelcomeImage
struct WelcomeImage: Codable {
    let uuid: String
    let order: Int
    let size: Int
}

// MARK: - WelcomeLocation
struct WelcomeLocation: Codable {
    let latitude: Double
    let longitude: Double
}

// MARK: - Reviews
struct Reviews: Codable {
    let ratingAverage: Double
    let ratingsCount: Int
    let reviewsCount: Int
}

enum WelcomeType: String, Codable {
    case museum, tour
}

// MARK: - WelcomeElement
struct DetailedTour: Codable {
    let uuid: String
    let type, category: String
    let duration, distance: Int
    let placement: String
    let map: Map
    let hash: String
    let size: Int
    let reviews: Reviews
    let content: [Content]
}

// MARK: - Image
struct Image: Codable {
    let uuid: String
    let order: Int
}

// MARK: - Content
struct Content: Codable {
    let audio, images: [Audio]
    let playback: Playback
    let summary, desc, title: String
    let children: [Child]
}

// MARK: - Audio
struct Audio: Codable {
    let uuid: String
    let duration: Int?
    let order: Int
    let size: Int
}

// MARK: - Child
struct Child: Codable {
    let uuid: String
    let type: ChildType
    let hidden: Bool
    let triggerZones: [TriggerZone]
    let images: [Audio]
    let location: ChildLocation
    let summary, desc, title: String
}

// MARK: - ChildLocation
struct ChildLocation: Codable {
    let altitude: Int
    let latitude, longitude: Double
}

// MARK: - TriggerZone
struct TriggerZone: Codable {
    let circleAltitude: Int
    let type: TriggerZoneType
    let circleLatitude, circleLongitude, circleRadius: Double

    enum CodingKeys: String, CodingKey {
        case circleAltitude = "circle_altitude"
        case type
        case circleLatitude = "circle_latitude"
        case circleLongitude = "circle_longitude"
        case circleRadius = "circle_radius"
    }
}

enum TriggerZoneType: String, Codable {
    case circle = "circle"
}

enum ChildType: String, Codable {
    case touristAttraction = "tourist_attraction"
}

// MARK: - Playback
struct Playback: Codable {
    let type: String
    let order: [String]
}

typealias BaseRouteList = [DetailedTour]
