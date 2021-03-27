//
//  ViewController.swift
//  AudioTour
//
//  Created by Administrator on 26.03.2021.
//

import UIKit

class FeedViewController: UIViewController {

    private var model: FeedModel!
    
    lazy var feedCellIdentifier = TourTableViewCell.self.description()
    
    var feedView: FeedView {
        view as! FeedView
    }
    
    override func loadView() {
        view = FeedView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = FeedModel(feedViewController: self)
        model.loadTours(in: "city")
        setupViews()
    }
    
    private func setupViews() {
        title = "City"
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: feedCellIdentifier, for: indexPath)
        guard let tourCell = cell as? TourTableViewCell else {
            return TourTableViewCell()
        }
        
        tourCell.configure(tourModel: model.tours[indexPath.row])
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
}
