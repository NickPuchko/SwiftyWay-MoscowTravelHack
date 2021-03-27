//
// Created by Иван Лизогуб on 27.03.2021.
//

import UIKit

protocol Identifiable {
    static var identifier: String {get}
}

class FeedViewCell: UICollectionViewCell {

    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder: NSCoder) {
        fatalError("FeedViewCell story not implemented")
    }

    private func setup() {

    }

    private func setupConstraints() {

    }
}

extension FeedViewCell: Identifiable {
    static var identifier: String {
        String(describing: self)
    }


}