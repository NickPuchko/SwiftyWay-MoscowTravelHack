//
//  RouteNetworkService.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import Foundation
import Alamofire

class RouteNetworkService {
    private lazy var decoder: JSONDecoder = {
        var result = JSONDecoder()
        result.keyDecodingStrategy = .convertFromSnakeCase
        return result
    }()
    
    private func makeURL(tourUuid: String) -> URL? {
        let token = "7c6c2db9-d237-4411-aa0e-f89125312494"
        var result = URLComponents()
        result.scheme = "https"
        result.host = "api.izi.travel"
        result.path = "/mtgobjects/\(tourUuid)"
        result.query = "languages=ru,en&includes=all&except=translations,publisher,download&api_key=\(token)"
        return result.url
    }
    //https://api.izi.travel/mtgobjects/91653357-ad92-4de8-9ab9-224ca1c96316?languages=ru,en&includes=all&except=translations,publisher,download&api_key=7c6c2db9-d237-4411-aa0e-f89125312494
    
    func getRoute(tourUuid: String, completion: @escaping (Result<Route, AFError>) -> Void) {
        guard let url = makeURL(tourUuid: tourUuid) else {
            completion(.failure(.otherError))
            return
        }
        AF.request(url).response { response in
            switch response.result {
            case .failure(let error):
                print(error)
                completion(.failure(.getError))
            case .success(let data):
                guard let json = data else {
                    completion(.failure(.otherError))
                    return
                }
                do {
                    let routes = try self.decoder.decode([Route].self, from: json)
                    completion(.success(routes[0]))
                } catch let error {
                    print(error)
                    completion(.failure(.otherError))
                }
            }
        }
    }
}
