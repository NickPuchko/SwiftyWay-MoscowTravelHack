//
//  ViewController.swift
//  AudioTour
//
//  Created by Administrator on 26.03.2021.
//

import UIKit

class FeedViewController: UIViewController {

    private var feedView: FeedView {
        view as! FeedView
    }
    
    override func loadView() {
        view = FeedView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "City"
        // Do any additional setup after loading the view.
    }

}
