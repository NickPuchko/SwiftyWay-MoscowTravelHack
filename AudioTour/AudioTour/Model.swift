// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct Tour: Codable {
    let uuid: String
    let type: WelcomeType
    let map: Map
    let childrenCount: Int
    let city: City
    let country: Country
    let contentProvider: ContentProvider
    let reviews: Reviews
    let images: [WelcomeImage]
    let location: WelcomeLocation
    let title: String
    let category: Category?
    let duration, distance: Int?
    let route: String?

    enum CodingKeys: String, CodingKey {
        case uuid,  type, map
        case childrenCount = "children_count"
        case city, country
        case contentProvider = "content_provider"
        case reviews, images, location, title, category, duration, distance, route
    }
    
    init(uuid: String, title: String, map: Map, childrenCount: Int, type: WelcomeType, category: Category,
         duration: Int?, city: City, distance: Int?, route: String, bounds: String, country: Country, contentProvider: ContentProvider, reviews: Reviews, images: [WelcomeImage], location: WelcomeLocation) {
        self.city = city
        self.country = country
        self.contentProvider = contentProvider
        self.reviews = reviews
        self.images = images
        self.location = location
        self.uuid = uuid
        self.map = map
        self.title = title
        self.childrenCount = childrenCount
        self.type = type
        self.category = category
        self.duration = duration ?? 0
        self.distance = distance ?? 0
        self.route = route
//        self.route = route.split {$0 == ";"}.map {$0.split {$0 == ","}}
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
// MARK: - Translation
struct Translation: Codable {
    let name: String
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
    let translations: [Translation]
    let map: Map
    let hash: Hash
    let title: Title
    let summary: String
    let location: CountryLocation

    enum CodingKeys: String, CodingKey {
        case uuid, type, translations, map, hash
        case title, summary, location
    }
}

enum Hash: String, Codable {
    case the9932Af8F3A0160Cb09Bee59A25Ba13Ce230A565D = "9932af8f3a0160cb09bee59a25ba13ce230a565d"
    case d41D8Cd98F00B204E9800998Ecf8427E = "d41d8cd98f00b204e9800998ecf8427e"
    case dfcb82Df86Ef22D1B835A0C7E4B52530 = "dfcb82df86ef22d1b835a0c7e4b52530"
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
    let hash, title, summary: String
    let images: [WelcomeImage]?
    let contentProvider: ContentProvider

    enum CodingKeys: String, CodingKey {
        case uuid, type, hash, title, summary, images
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

typealias Tours = [Tour]


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct BaseRoute: Codable {
    let uuid: String
    let type, category: String
    let duration, distance: Int
    let placement: String
    let map: Map
    let hash: String
    let size: Int
    let city: City
    let country: Country
    let contentProvider: ContentProvider
    let reviews: Reviews
    let content: [Content]
    let location: CityLocation

    enum CodingKeys: String, CodingKey {
        case uuid, type, category, duration, distance, placement, map, hash, size, city, country
        case contentProvider = "content_provider"
        case reviews, content, location
    }
}

// MARK: - Image
struct Image: Codable {
    let uuid, type: String
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
    let type: AudioType
    let duration: Int?
    let order: Int
    let hash: Hash
    let size: Int
}
enum AudioType: String, Codable {
    case story = "story"
}

// MARK: - Child
struct Child: Codable {
    let uuid: String
    let type: ChildType
    let hidden: Bool
    let hash: String
    let triggerZones: [TriggerZone]
    let contentProvider: ContentProvider
    let images: [Audio]
    let location: ChildLocation
    let summary, desc, title: String

    enum CodingKeys: String, CodingKey {
        case uuid, type, hidden, hash
        case triggerZones = "trigger_zones"
        case contentProvider = "content_provider"
        case images, location, summary, desc, title
    }
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

typealias BaseRouteList = [BaseRoute]
