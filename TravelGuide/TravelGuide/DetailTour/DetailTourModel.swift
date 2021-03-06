//
//  DetailTourModel.swift
//  AudioTour
//
//  Created by Максим Сурков on 27.03.2021.
//

import Foundation

class DetailTourModel {
    weak var detailTourViewController: DetailTourViewController!
    let routeManager = RouteNetworkService()
    let imageManager = ImageNetworkService()
    private let group = DispatchGroup()
    private let serialQueue = DispatchQueue(label: "serial.queue")
    private var images: [Data?] = []
    
    let tour: Tour
    var route: Route?
    
    init(vc: DetailTourViewController, selectedTour: Tour) {
        detailTourViewController = vc
        tour = selectedTour
    }
    
    func loadRoute() {
        detailTourViewController.detailTourView.letPathButton.isEnabled = false
        routeManager.getRoute(tourUuid: tour.uuid) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let route):
                guard let route = route else { return }
                
                strongSelf.route = route
                strongSelf.detailTourViewController.detailTourView.letPathButton.isEnabled = true
                strongSelf.getImages(route: route)
            }
        }
    }

    private func getImages(route: Route) {
        for image in route.content[0].images {
            group.enter()
            serialQueue.async { [weak self] in
                self?.imageManager.getImage(
                        providerUuid: self?.tour.contentProvider.uuid ?? "",
                        image: image) { result in
                    switch result {
                    case .success(let data):
                        self?.images += [data]

                    case .failure(let error):
                        print(error)
                        self?.images += [nil]
                    }
                    self?.group.leave()
                }
            }
        }
        group.notify(queue: .main) { [weak self] in
            self?.detailTourViewController.updateView(
                    with: route, tour: self!.tour, viewModel: DetailViewModel(images: self?.images ?? []))
        }
    }

}
