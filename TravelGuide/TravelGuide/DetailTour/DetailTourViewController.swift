//
//  DetailTourViewController.swift
//  AudioTour
//
//  Created by Максим Сурков on 27.03.2021.
//

import Foundation
import UIKit
import AVFoundation

class DetailTourViewController: UIViewController{
    
    var player: AVAudioPlayer?
    
    var detailTourModel: DetailTourModel!
    
    var detailTourView: DetailTourView {
        view as! DetailTourView
    }
    
    override func loadView() {
        view = DetailTourView(handleContinue: showAudioAlert)
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
    
    func updateView(with route: Route, tour: Tour, viewModel: DetailViewModel) {
        detailTourView.updateViewModel(viewModel: viewModel)
        detailTourView.descriptionView.text = route.content[0].desc
        let rating = Int(tour.reviews?.ratingAverage ?? 0) ?? 0
        let filledStarsCount = (rating/2)
        let halfFilledStarsCount = (rating % 2) == 0 ? 0 : 1
        for i in 0..<filledStarsCount {
            detailTourView.starImageViewsArray[i].image = UIImage(systemName: "star.fill")
        }
        for i in 0..<halfFilledStarsCount {
            detailTourView.starImageViewsArray[filledStarsCount + i].image = UIImage(systemName: "star.leadinghalf.fill")
        }
    }
    
    private func showAudioAlert(){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Продолжить с аудиогидом", style: .default, handler: { _ in
            self.showMapVC()
        }))
        alert.addAction(UIAlertAction(title: "Оставьте меня в тишине!", style: .default, handler: { _ in
            self.showMapVC()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func showMapVC() {
        let vc = MapViewController()
        let model = MapModel(vc: vc, selectedRoute: detailTourModel.route!, selectedTour: detailTourModel.tour)
        vc.mapModel = model
        navigationController?.pushViewController(vc, animated: true)
    }

}

