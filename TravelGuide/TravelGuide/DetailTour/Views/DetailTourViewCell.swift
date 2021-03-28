//
// Created by Иван Лизогуб on 28.03.2021.
//

import UIKit

class DetailTourViewCell: UICollectionViewCell {
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("not implemented")
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.pins()
    }

    func update(with image: Data?) {
        if let image = image {
            imageView.image = UIImage(data: image)
        } else {
            imageView.image = UIImage(systemName: "questionmark")
        }
    }
}

extension DetailTourViewCell: Identifiable {
    static var identifier: String {
        String(describing: self)
    }


}