//
//  MapModel.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import Foundation

class MapModel {
    weak var mapViewController: MapViewController!
    var route: Route
    
    init(vc: MapViewController, selectedRoute: Route) {
        mapViewController = vc
        route = selectedRoute
    }
}
