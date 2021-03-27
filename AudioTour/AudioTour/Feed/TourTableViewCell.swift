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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(tourModel: Tour) {
//        if let image = tourModel.image {
//            tourLogoImageView.image =
//        }
        tourLogoImageView.image = tourModel.image ?? UIImage(named: "house")
        nameLabel.text = tourModel.title
        typeLabel.text = tourModel.type.rawValue
        durationLabel.text = tourModel.duration.description
    }
}
