//
//  FeedView.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import UIKit

class FeedView: UIView {

    private let collectionView: UICollectionView

    init(delegate: FeedViewController) {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        super.init(frame: .zero)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        [collectionView].forEach {$0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: superview!.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: superview!.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: superview!.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: superview!.bottomAnchor)
        ])
    }
}
