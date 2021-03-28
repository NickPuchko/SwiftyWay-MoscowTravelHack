//
//  FeedModel.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import Foundation

class FeedModel {
    weak var feedViewController: FeedViewController!
    var networkManager = ToursNetworkService()
    var imageManager = ImageNetworkService()
    var tours: [Tour] = []
    var images: [Data?] = []
    private let group = DispatchGroup()
    private let serialQueue = DispatchQueue(label: "private.serial.queue")
    
    let routeManager = RouteNetworkService()
    
    init(vc: FeedViewController) {
        feedViewController = vc
    }
    
    func loadTours() {
        networkManager.getTours(city: "Мурманск") { [unowned self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let tours):
                self.tours = tours.filter { $0.type == .tour }
                getImages(tours: tours)
                

            }
        }
    }

    private func getImages(tours: [Tour]) {
        for tour in tours {
            group.enter()
            serialQueue.async { [unowned self] in

                imageManager.getImage(
                        providerUuid: tour.contentProvider.uuid,
                        image: Image(uuid: (tour.images?.first?.uuid ?? ""))
                ) { result in
                    switch result {
                    case .success(let data):
                        images += [data]
                    case .failure(let error):
                        print(error)
                        images += [nil]
                    }
                    group.leave()
                }
            }
        }

        group.notify(queue: .main) { [unowned self] in
            feedViewController.updateViewModels(with: makeViewModels())
        }
    }

    private func makeViewModels() -> [ViewModel] {
        var result: [ViewModel] = []
        for i in 0..<tours.count {
            let viewModel: ViewModel = ViewModel(
                    image: images[i],
                    title: tours[i].title,
                    type: tours[i].category,
                    duration: tours[i].duration,
                    rating: Int(tours[i].reviews?.ratingAverage ?? 0.0))
            result.append(viewModel)
        }
        return result
    }
}
