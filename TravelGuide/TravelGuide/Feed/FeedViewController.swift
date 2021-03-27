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
    }

}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }

}

extension FeedViewController: UICollectionViewDelegate {

}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    
}
