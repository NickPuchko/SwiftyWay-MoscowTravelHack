//
//  NetworkManager.swift
//  AudioTour
//
//  Created by Максим Сурков on 27.03.2021.
//

import Foundation

class NetworkManager {
    
    private var dataTask: URLSessionDataTask?
    
    private lazy var decoder: JSONDecoder = {
        var result = JSONDecoder()
        result.keyDecodingStrategy = .convertFromSnakeCase
        return result
    }()
    
    private func makeUrl(for symbol: String) -> URL? {
        let token = "7c6c2db9-d237-4411-aa0e-f89125312494"
        var result = URLComponents()
        result.scheme = "https"
        result.host = "api.izi.travel"
        result.path = "/mtg/objects/search/"
        result.query = "languages=ru,en&includes=all&api_key=\(token)&query=\(symbol)"
        return result.url
    }
    
    private func makeUrlForAudio(uuid: String, audio_uuid: String) -> URL? {
        let token = "7c6c2db9-d237-4411-aa0e-f89125312494"
        var result = URLComponents()
        result.scheme = "https"
        result.host = "media.izi.travel"
        result.path = "/\(uuid)/\(audio_uuid).m4a"
        result.query = "api_key=\(token)"
        return result.url
    }
    
    private func makeUrlForImage(uuid: String, image_uuid: String) -> URL? {
        let token = "7c6c2db9-d237-4411-aa0e-f89125312494"
        var result = URLComponents()
        result.scheme = "https"
        result.host = "media.izi.travel"
        result.path = "/\(uuid)/\(image_uuid).jpg"
        result.query = "api_key=\(token)"
        return result.url
    }
}

extension NetworkManager {
    func getTours(city: String, completion: @escaping (Result<[Tour], Error>) -> Void) {
        let tourURL = makeUrl(for: city)
        dataTask = URLSession.shared.dataTask(with: tourURL!) { (data, response, error) in
            if let error = error {
               print("DataTask error: \(error.localizedDescription)")
               return
            }
            guard let response = response as? HTTPURLResponse, let data = data else {
               print("Empty Response")
               return
            }
            print("Response status code: \(response.statusCode)")
            do {
                
                let jsonData = try self.decoder.decode([Tour].self, from: data)
                print(String(data: data, encoding: .utf8))
                completion(.success(jsonData))
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    
    func getAudio(provider_uuid: String, audio_uuid: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let audioURL = makeUrlForAudio(uuid: provider_uuid, audio_uuid: audio_uuid)
        dataTask = URLSession.shared.dataTask(with: audioURL!) { (data, response, error) in
            if let error = error {
               print("DataTask error: \(error.localizedDescription)")
               return
            }
            guard let response = response as? HTTPURLResponse, let data = data else {
               print("Empty Response")
               return
            }
            print("Response status code: \(response.statusCode)")
            completion(.success(data))
        }
        dataTask?.resume()
    }
    
    func getImage(provider_uuid: String, image_uuid: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let audioURL = makeUrlForImage(uuid: provider_uuid, image_uuid: image_uuid)
        dataTask = URLSession.shared.dataTask(with: audioURL!) { (data, response, error) in
            if let error = error {
               print("DataTask error: \(error.localizedDescription)")
               return
            }
            guard let response = response as? HTTPURLResponse, let data = data else {
               print("Empty Response")
               return
            }
            print("Response status code: \(response.statusCode)")
            completion(.success(data))
        }
        dataTask?.resume()
    }
}
