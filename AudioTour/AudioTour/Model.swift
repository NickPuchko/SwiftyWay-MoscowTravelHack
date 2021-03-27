// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let uuid: String
    let status: Status
    let type: WelcomeType
    let map: Map
    let hash: String
    let childrenCount: Int
    let city: City
    let country: Country
    let contentProvider: ContentProvider
    let reviews: Reviews
    let publisher: Publisher
    let images: [WelcomeImage]
    let location: WelcomeLocation
    let summary, title: String
    let category: Category?
    let duration, distance: Int?
    let placement: Placement?
    let route: String?

    enum CodingKeys: String, CodingKey {
        case uuid, status, type, map, hash
        case childrenCount = "children_count"
        case city, country
        case contentProvider = "content_provider"
        case reviews, publisher, images, location, summary, title, category, duration, distance, placement, route
    }
}

enum Category: String, Codable {
    case car = "car"
    case walk = "walk"
}

// MARK: - City
struct City: Codable {
    let uuid: String
    let type: CityType
    let status: Status
    let translations: [Translation]
    let map: Map
    let hash: String
    let visible: Bool
    let title, summary: String
    let images: [CityImage]?
    let location: CityLocation
}

// MARK: - CityImage
struct CityImage: Codable {
    let uuid: String
    let type: CityType
    let order: Int
}

enum CityType: String, Codable {
    case city = "city"
}

// MARK: - CityLocation
struct CityLocation: Codable {
    let altitude: Int
    let latitude, longitude: Double
    let countryUUID: String

    enum CodingKeys: String, CodingKey {
        case altitude, latitude, longitude
        case countryUUID = "country_uuid"
    }
}

// MARK: - Map
struct Map: Codable {
    let bounds: String
}

enum Status: String, Codable {
    case published = "published"
}

// MARK: - Translation
struct Translation: Codable {
    let name: String
    //let language: Language
}

// MARK: - ContentProvider
struct ContentProvider: Codable {
    let uuid, name: String
    let copyright: Copyright?
}

enum Copyright: String, Codable {
    case clubParkExtrem2016 = "© ClubParkExtrem, 2016"
    case cМончегорскийМузейЦветногоКамняИмениВНДава2014 = "(c) Мончегорский музей цветного камня имени В.Н. Дава, 2014"
    case cМурманскийОбластнойХудожественныйМузей = "(c) Мурманский областной художественный музей"
    case empty = ""
}

// MARK: - Country
struct Country: Codable {
    let uuid: String
    let type: CountryType
    let status: Status
    let translations: [Translation]
    let map: Map
    let hash: Hash
    let title: Title
    let summary: String
    let location: CountryLocation

    enum CodingKeys: String, CodingKey {
        case uuid, type, status, translations, map, hash
        case title, summary, location
    }
}

enum Hash: String, Codable {
    case the9932Af8F3A0160Cb09Bee59A25Ba13Ce230A565D = "9932af8f3a0160cb09bee59a25ba13ce230a565d"
}

// MARK: - CountryLocation
struct CountryLocation: Codable {
    let altitude: Int
    let latitude, longitude: Double
}

enum Title: String, Codable {
    case россия = "Россия"
}

enum CountryType: String, Codable {
    case country = "country"
}

// MARK: - WelcomeImage
struct WelcomeImage: Codable {
    let uuid: String
    let type: PurpleType
    let order: Int
    let hash: String
    let size: Int
}

enum PurpleType: String, Codable {
    case brandLogo = "brand_logo"
    case story = "story"
}

// MARK: - WelcomeLocation
struct WelcomeLocation: Codable {
    let ip: String?
    let altitude: Int
    let cityUUID: String
    let countryUUID: String
    let latitude, longitude: Double

    enum CodingKeys: String, CodingKey {
        case ip, altitude
        case cityUUID = "city_uuid"
        case countryUUID = "country_uuid"
        case latitude, longitude
    }
}

enum Placement: String, Codable {
    case outdoor = "outdoor"
}

// MARK: - Publisher
struct Publisher: Codable {
    let uuid: String
    let type: PublisherType
    let status: Status
    let hash, title, summary: String
    let images: [WelcomeImage]?
    let contentProvider: ContentProvider

    enum CodingKeys: String, CodingKey {
        case uuid, type, status, hash, title, summary,  images
        case contentProvider = "content_provider"
    }
}

enum PublisherType: String, Codable {
    case publisher = "publisher"
}

// MARK: - Reviews
struct Reviews: Codable {
    let ratingAverage: Double
    let ratingsCount, reviewsCount: Int

    enum CodingKeys: String, CodingKey {
        case ratingAverage = "rating_average"
        case ratingsCount = "ratings_count"
        case reviewsCount = "reviews_count"
    }
}

enum WelcomeType: String, Codable {
    case museum = "museum"
    case tour = "tour"
}

typealias Welcome = [WelcomeElement]
