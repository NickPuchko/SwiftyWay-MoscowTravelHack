//
//  FeedView.swift
//  AudioTour
//
//  Created by Николай Пучко on 27.03.2021.
//

import UIKit
import MapKit

class FeedView: UIView {
    
//    let searchVC = UISearchController()
    
    let toursTableView = UITableView(frame: .zero, style: .plain)
    
    init(delegate: FeedViewController) {
        super.init(frame: .zero)
        
        toursTableView.delegate = delegate
        toursTableView.dataSource = delegate
        
        setupTableView()
        setupConstraints()
        
        backgroundColor = .white
    }
    
    private func setupTableView() {
        addSubview(toursTableView)
        
        toursTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            toursTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            toursTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            toursTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            toursTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
