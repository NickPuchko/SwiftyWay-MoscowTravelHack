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
    
    let tour: Tour
    var route: Route?
    
    init(vc: DetailTourViewController, selectedTour: Tour) {
        detailTourViewController = vc
        tour = selectedTour
    }
    
    func loadRoute() {
        routeManager.getRoute(tourUuid: tour.uuid) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let route):
                self.route = route
                self.detailTourViewController.updateView(with: route)
            }
        }
    }
}
