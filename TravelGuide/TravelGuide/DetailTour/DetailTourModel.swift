//
//  DetailTourModel.swift
//  AudioTour
//
//  Created by Максим Сурков on 27.03.2021.
//

import Foundation

class DetailTourModel {
    weak var detailTourViewController: DetailTourViewController!
    let tour: Tour
    
    init(vc: DetailTourViewController, selectedTour: Tour) {
        detailTourViewController = vc
        tour = selectedTour
    }
}
