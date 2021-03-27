//
//  ToursNetworkService.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import Foundation

class ToursNetworkService {
    private lazy var decoder: JSONDecoder = {
        var result = JSONDecoder()
        result.keyDecodingStrategy = .convertFromSnakeCase
        return result
    }()
    
    private func makeURL(city: String) -> URL {
        let token = "7c6c2db9-d237-4411-aa0e-f89125312494"
        var result = URLComponents()
        result.scheme = "https"
        result.host = "api.izi.travel"
        result.path = "/mtg/objects/search/"
        result.query = "languages=ru,en&includes=all&api_key=\(token)&query=\(city)"
        return result.url!
    }
}
