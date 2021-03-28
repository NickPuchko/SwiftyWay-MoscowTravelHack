//
//  AudioNetworkService.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import Foundation
import Alamofire

class AudioNetworkService {
    private lazy var decoder: JSONDecoder = {
        var result = JSONDecoder()
        result.keyDecodingStrategy = .convertFromSnakeCase
        return result
    }()
    
    private func makeURL(providerUuid: String, audio: Audio) -> URL? {
        let token = "7c6c2db9-d237-4411-aa0e-f89125312494"
        var result = URLComponents()
        result.scheme = "https"
        result.host = "media.izi.travel"
        result.path = "/\(providerUuid)/\(audio.uuid).m4a"
        result.query = "api_key=\(token)"
        return result.url
    }
    
    func getAudio(providerUuid: String, audio: Audio, completion: @escaping (Result<Data, AFError>) -> Void) {
        guard let url = makeURL(providerUuid: providerUuid, audio: audio) else {
            completion(.failure(.otherError))
            return
        }
        AF.request(url).response { response in
            switch response.result {
            case .failure(let error):
                print(error)
                completion(.failure(.getError))
            case .success(let data):
                guard let audioData = data else {
                    completion(.failure(.otherError))
                    return
                }
                completion(.success(audioData))
            }
        }
    }
}
