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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedModel = FeedModel(vc: self)
    }
    
    override func loadView() {
        view = FeedView(delegate: self)
    }
}
