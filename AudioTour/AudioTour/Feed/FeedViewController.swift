//
//  ViewController.swift
//  AudioTour
//
//  Created by Administrator on 26.03.2021.
//

import UIKit

class FeedViewController: UIViewController {

    lazy var feedCellIdentifier = TourTableViewCell.self.description()
    
    private var feedView: FeedView {
        view as! FeedView
    }
    
    override func loadView() {
        view = FeedView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "City"
        // Do any additional setup after loading the view.
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: feedCellIdentifier, for: indexPath)
        // configure(...)
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
}
