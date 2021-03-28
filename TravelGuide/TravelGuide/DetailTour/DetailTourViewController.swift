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
    
    var detailTourView: DetailTourView {
        view as! DetailTourView
    }
    
    override func loadView() {
        view = DetailTourView()
        view.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        detailTourModel.loadRoute()
    }
    
    private func setupViews() {
        detailTourView.nameLabel.text = detailTourModel.tour.title
        detailTourView.organizationNameLabel.text = detailTourModel.tour.contentProvider.name
    }
    
    func updateView(with route: Route) {
        detailTourView.descriptionView.text = route.content[0].desc
    }
}
