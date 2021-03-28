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
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5.0, bottom: 0, right: 5.0)
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        collectionView.backgroundColor = .white
        collectionView.register(FeedViewCell.self, forCellWithReuseIdentifier: FeedViewCell.identifier)
        super.init(frame: .zero)

        addSubview(collectionView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        [collectionView].forEach {$0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: collectionView.superview!.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: collectionView.superview!.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: collectionView.superview!.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: collectionView.superview!.bottomAnchor)
        ])
    }

    func reloadData() {
        collectionView.reloadData()
    }
}
