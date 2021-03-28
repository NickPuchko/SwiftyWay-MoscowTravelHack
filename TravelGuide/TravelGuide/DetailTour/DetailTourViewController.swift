//
//  DetailTourViewController.swift
//  AudioTour
//
//  Created by Максим Сурков on 27.03.2021.
//

import Foundation
import UIKit

class DetailTourViewController: UIViewController{
    
    var detailTourModel: DetailTourModel!
    private let detailTourView = DetailTourView()
    
    override func loadView() {
        view = detailTourView
        view.backgroundColor = .white
        //setup()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
