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
    let playButton =  UIButton()
    let stopButton =  UIButton()
    var didTapPlay: () -> Void
    var didTapStop: () -> Void
    init(delegate: MapViewController, handlePlay: @escaping () -> Void, handleStop: @escaping () -> Void) {
        containerView = UIView()
        containerView.backgroundColor = .systemGray6
        mapView = MKMapView()
        mapView.delegate = delegate
        self.didTapPlay = handlePlay
        self.didTapStop = handleStop
        super.init(frame: .zero)
        setupButtons()
        containerView.addSubview(playButton)
        containerView.addSubview(stopButton)
        addSubview(containerView)
        addSubview(mapView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupButtons(){
        playButton.setBackgroundImage(UIImage(systemName: "play"), for: .normal)
        stopButton.setBackgroundImage(UIImage(systemName: "stop"), for: .normal)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
    }
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: containerView.topAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
            playButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            playButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            
            stopButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 12),
            stopButton.topAnchor.constraint(equalTo: playButton.topAnchor)
            
        ])
    }
    @objc func playButtonTapped(){
        print("asdasdasd")
        didTapPlay()
    }
    @objc func stopButtonTapped(){
        didTapStop()
    }
    
}
