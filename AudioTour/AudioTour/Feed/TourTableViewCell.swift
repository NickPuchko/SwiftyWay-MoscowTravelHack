//
//  TourTableViewCell.swift
//  AudioTour
//
//  Created by Николай Пучко on 27.03.2021.
//

import UIKit

class TourTableViewCell: UITableViewCell {

    @IBOutlet weak var tourLogoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    func configure(tourModel: Tour) {
//        if let image = tourModel.image {
//            tourLogoImageView.image =
//        }
        nameLabel.text = tourModel.title
        typeLabel.text = "Tour"
        durationLabel.text = tourModel.duration?.description
    }
}
