//
//  MapViewController.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var mapModel: MapModel!
    
    var mapView: MapView {
        view as! MapView
    }
    
    override func loadView() {
        view = MapView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension MapViewController: MKMapViewDelegate {
    
}
