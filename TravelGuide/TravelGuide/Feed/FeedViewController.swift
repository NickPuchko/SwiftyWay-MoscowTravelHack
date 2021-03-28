//
//  ViewController.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import UIKit

class FeedViewController: UIViewController {

    var feedModel: FeedModel!
    
    var feedView: FeedView {
        view as! FeedView
    }

    override func loadView() {
        view = FeedView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedModel = FeedModel(vc: self)
        feedModel.loadTours()
        }
    }

    private var viewModels: [ViewModel] = [
        ViewModel(
                image: "",
                title: "SOME cool title",
                type: "walk",
                duration: 26500,
                rating: 9
        ),
        ViewModel(
                image: "",
                title: "SOME Other cool title",
                type: "running",
                duration: 38000,
                rating: 0)
    ]


extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedViewCell.identifier, for: indexPath)
                as? FeedViewCell else {fatalError("incorrect cell")}
        let viewModel = viewModels[indexPath.item]
        cell.update(with: viewModel)
        return cell
    }

}

extension FeedViewController: UICollectionViewDelegate {

}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio: CGFloat = 1.0
        let width = (collectionView.frame.width - Constants.padding - Constants.interItemSpacing)/2
        let height = ratio * width
        return CGSize(width: width, height: height)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.interItemSpacing
    }
}

enum Constants {
    static let padding: CGFloat = 10.0
    static let interItemSpacing: CGFloat = 8.0
    static let starsCount = 5
}

struct ViewModel {
    let image: String
    let title: String
    let type: String
    let duration: Int?
    let rating: Int?
}
