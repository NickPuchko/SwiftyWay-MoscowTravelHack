//
//  MapViewController.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    var mapModel: MapModel!
//    let locationManager = CLLocationManager()

//    private var currentPlace: CLPlacemark?
    
    var mapView: MapView {
        view as! MapView
    }
    
    override func loadView() {
        view = MapView(delegate: self, handlePlay: mapModel.playSound, handleStop: mapModel.stopSound)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapModel.loadAudio()
        setupMap()
    }
    
    private func setupMap() {
        guard let location = mapModel.tour.location else {
            return
        }
        let radius: Double = 5000
        var mapPoint = MKMapPoint(.init(latitude: location.latitude, longitude: location.longitude))
        mapPoint.x -= radius
        mapPoint.y -= radius
        let mapRect = MKMapRect(origin: mapPoint, size: MKMapSize(width: radius * 2, height: radius * 2))
        mapView.mapView.setVisibleMapRect(mapRect, animated: true)
        
        let welcomeAnnotation = MKPointAnnotation()
        welcomeAnnotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        mapView.mapView.addAnnotation(welcomeAnnotation)
        
    }
    
//    private func setupCL() {
//        guard CLLocationManager.locationServicesEnabled() else {
//            print("CLLocationManager.locationServicesDisabled")
//            return
//        }
//        locationManager.delegate = self
//        if CLLocationManager.authorizationStatus() == .notDetermined {
//            locationManager.requestWhenInUseAuthorization()
//        } else {
//            locationManager.requestLocation()
//        }
//
//    }
}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
