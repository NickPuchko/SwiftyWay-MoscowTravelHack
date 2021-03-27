//
//  TourMapViewController.swift
//  AudioTour
//
//  Created by Иван Лизогуб on 27.03.2021.
//

import UIKit
import MapKit
import CoreLocation

class TourMapViewController: UIViewController {
    // MARK: Views
    let mapView = MKMapView()
    
    // MARK: Properties
    let tour: Tour
    
    // MARK: Init
    init(tour: Tour) {
        self.tour = tour
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("not implemented")
    }

    // MARK: ViewController lyfecycle
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        setup()
        setupConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let origin = MKMapPoint(x: tour.bounds.startPoint.latitude, y: tour.bounds.startPoint.longitude)
//        let size = MKMapSize(width: tour.bounds.endPoint.latitude - tour.bounds.startPoint.latitude,
//                             height: tour.bounds.endPoint.longitude - tour.bounds.startPoint.longitude)
//        let rect = MKMapRect(origin: origin, size: size)
//        let region = MKCoordinateRegion(rect)
//        print(region)
//        mapView.setRegion(region, animated: true)
    }
    
    private func setup() {
        setupMapView()
    }
    
    private func setupMapView() {
        view.addSubview(mapView)
//        let center = (latitude: (tour.bounds.endPoint.latitude + tour.bounds.startPoint.latitude)/2,
//                        longitude:(tour.bounds.endPoint.longitude + tour.bounds.startPoint.longitude)/2)
        
        let startPoint = CLLocation(latitude: tour.bounds.startPoint.latitude,
                                    longitude: tour.bounds.startPoint.longitude)
        let endPoint = CLLocation(latitude: tour.bounds.endPoint.latitude,
                                  longitude: tour.bounds.endPoint.longitude)
        let distanceInMeters = startPoint.distance(from: endPoint)
        
        let rect = MKMapRect(
            x: min(tour.bounds.startPoint.latitude, tour.bounds.endPoint.latitude),
            y: min(tour.bounds.startPoint.longitude, tour.bounds.endPoint.longitude),
            width: abs(tour.bounds.endPoint.latitude - tour.bounds.startPoint.latitude),
            height: abs(tour.bounds.endPoint.longitude - tour.bounds.startPoint.longitude))
        let region = MKCoordinateRegion(rect)
        
    }
    
    private func setupConstraints() {
        [mapView]
            .forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: mapView.superview!.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: mapView.superview!.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: mapView.superview!.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: mapView.superview!.bottomAnchor)
        ])
    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
