//
//  MapModel.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import Foundation

class MapModel {
    weak var mapViewController: MapViewController!
    var audioManager = AudioNetworkService()
    
    var route: Route
    var tour: Tour
    
    init(vc: MapViewController, selectedRoute: Route, selectedTour: Tour) {
        mapViewController = vc
        route = selectedRoute
        tour = selectedTour
    }
    
    func loadAudio() {
        if let audio = route.content[0].audio?[0] {
            audioManager.getAudio(providerUuid: tour.contentProvider.uuid, audio: audio) { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    // TODO: set audio
                    print(data)
                }
            }

        }
    }
}
