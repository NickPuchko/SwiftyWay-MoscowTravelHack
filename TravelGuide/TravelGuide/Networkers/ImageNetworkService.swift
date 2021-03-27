//
//  ImageNetworkService.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import Foundation
import Alamofire

class ImageNetworkService {
    private lazy var decoder: JSONDecoder = {
        var result = JSONDecoder()
        result.keyDecodingStrategy = .convertFromSnakeCase
        return result
    }()
    
    private func makeURL(providerUuid: String, image: Image) -> URL? {
        guard let uuid = image.uuid else {
            return nil
        }
        let token = "7c6c2db9-d237-4411-aa0e-f89125312494"
        var result = URLComponents()
        result.scheme = "https"
        result.host = "media.izi.travel"
        result.path = "/\(providerUuid)/\(uuid)_800x600.jpg"
        result.query = "api_key=\(token)"
        return result.url
    }
    
    func getImage(providerUuid: String, image: Image, completion: @escaping (Result<Data, AFError>) -> Void) {
        guard let url = makeURL(providerUuid: providerUuid, image: image) else {
            completion(.failure(.otherError))
            return
        }
        AF.request(url).response { response in
            switch response.result {
            case .failure(let error):
                print(error)
                completion(.failure(.getError))
            case .success(let data):
                if let imageData = data {
                    completion(.success(imageData))
                } else {
                    completion(.failure(.otherError))
                }
            }
        }
    }
}
