//
//  MapView.swift
//  TravelGuide
//
//  Created by Николай Пучко on 28.03.2021.
//

import UIKit
import MapKit

class MapView: UIView {

    let mapView: MKMapView
    let containerView: UIView
    
    init(delegate: MapViewController) {
        containerView = UIView()
        containerView.backgroundColor = .systemGray6
        mapView = MKMapView()
        mapView.delegate = delegate
        super.init(frame: .zero)
        addSubview(containerView)
        addSubview(mapView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: containerView.topAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
