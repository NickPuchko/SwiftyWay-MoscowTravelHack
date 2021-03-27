//
//  NetworkManager.swift
//  AudioTour
//
//  Created by Максим Сурков on 27.03.2021.
//

import Foundation
protocol NetworkManagerProtocol {
    func fetchDataTour(symbol: String, completion: @escaping (Result<[WelcomeElement], Error>) -> Void)
}
class NetworkManager {
    
    private var dataTask: URLSessionDataTask?
    let default_url = URL(string: "https://api.izi.travel/mtg/objects/search?languages=ru,en&includes=all&api_key=7c6c2db9-d237-4411-aa0e-f89125312494&query=Мурманск")
    private func makeUrl(for symbol: String) -> URL? {
        let token = "7c6c2db9-d237-4411-aa0e-f89125312494"
        var result = URLComponents()
        result.scheme = "https"
        result.host = "api.izi.travel"
        result.path = "/mtg/objects/search/"
        result.query = "languages=ru,en&includes=all&api_key=\(token)&query=\(symbol)"
        return result.url
//        let url = "https://api.izi.travel/mtg/objects/search?languages=ru,en&includes=all&api_key=7c6c2db9-d237-4411-aa0e-f89125312494&query="
//            + symbol
    }
}
extension NetworkManager {
    func fetchDataTour(symbol: String, completion: @escaping (Result<[WelcomeElement], Error>) -> Void) {
        let tourURL = makeUrl(for: symbol)
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
            // print(String(decoding: data, as: UTF8.self))
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Welcome.self, from: data)
            print(jsonData)
            DispatchQueue.main.async {
                completion(.success(jsonData))
            }
       }
           catch let error {
                completion(.failure(error))
           }
        }
        dataTask?.resume()
    }
}
