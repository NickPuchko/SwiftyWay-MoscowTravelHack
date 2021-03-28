//
// Created by Иван Лизогуб on 27.03.2021.
//

import UIKit

protocol Identifiable {
    static var identifier: String {get}
}

class FeedViewCell: UICollectionViewCell {

    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let durationLabel = UILabel()
    private let tourType = UIImageView()
    private let ratingStack = UIStackView()
    private var starImageViewsArray: [UIImageView] = []

    private let formatter: DateComponentsFormatter = {
        let result = DateComponentsFormatter()
        result.allowedUnits = [.hour, .minute, .second]
        result.unitsStyle = .positional
        return result
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("FeedViewCell story not implemented")
    }

    private func setup() {
        contentView.layer.cornerRadius = 18.0
        contentView.clipsToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(durationLabel)
        contentView.addSubview(tourType)
        contentView.addSubview(ratingStack)

        imageView.backgroundColor = .lightGray

        titleLabel.numberOfLines = 3
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        durationLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        ratingStack.axis = .horizontal
        ratingStack.distribution = .fillEqually
        for _ in 0..<5 {
            let imageView = UIImageView(image: UIImage(systemName: "star"))
            ratingStack.addArrangedSubview(imageView)
            imageView.tintColor = .systemYellow
            starImageViewsArray.append(imageView)
        }
    }

    private func setupConstraints() {
        [imageView,
        durationLabel,
        tourType,
        ratingStack,
        titleLabel].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        let safeArea = contentView.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: durationLabel.leadingAnchor, constant: -10.0),

            durationLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),
            durationLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),

            tourType.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5.0),
            tourType.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),

            ratingStack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            ratingStack.trailingAnchor.constraint(lessThanOrEqualTo: tourType.leadingAnchor),
            ratingStack.centerYAnchor.constraint(equalTo: tourType.centerYAnchor)
        ])
    }

    func update(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title

        if let image = viewModel.image {
            imageView.image = UIImage(data: image)
        } else {
            imageView.image = UIImage(systemName: "questionmark")
        }

        let formattedString = formatter.string(from: TimeInterval(viewModel.duration ?? 0))!
        durationLabel.text = formattedString

        let filledStarsCount = ((viewModel.rating ?? 0)/2)
        let halfFilledStarsCount = ((viewModel.rating ?? 0) % 2) == 0 ? 0 : 1
        for i in 0..<filledStarsCount {
            starImageViewsArray[i].image = UIImage(systemName: "star.fill")
        }
        for i in 0..<halfFilledStarsCount {
            starImageViewsArray[filledStarsCount + i].image = UIImage(systemName: "star.leadinghalf.fill")
        }

        tourType.image = UIImage(systemName: "figure.walk")
        tourType.tintColor = .black
    }
}

extension FeedViewCell: Identifiable {
    static var identifier: String {
        String(describing: self)
    }


}
