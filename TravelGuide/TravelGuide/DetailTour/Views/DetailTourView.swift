//
//  DetailTourView.swift
//  AudioTour
//
//  Created by Максим Сурков on 27.03.2021.
//

import Foundation
import UIKit
import Cosmos
import TinyConstraints

class DetailTourView: AutoLayoutView {
    
    let scrollableStackView: ScrollableStackView = {
        let config: ScrollableStackView.Config = ScrollableStackView.Config(
                stack: ScrollableStackView.Config.Stack(axis: .vertical, distribution: .fill,
                        alignment: .fill, spacing: 0),
                scroll: .defaultVertical,
                pinsStackConstraints: UIEdgeInsets(top: 0, left: 0, bottom: 0.0, right: 0)
        )
        return ScrollableStackView(config: config)
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .blue
        
        return cv
    }()
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.settings.starSize = 25
        return view
    }()
    
    let rateView = UIView()
    let descriptionView = UITextView()
    let letPathView = UIView()
    let letPathButton = UIButton(type: .system)
    let organizationView = UIView()
    
    //rateView
    let nameLabel = UILabel()
    let categoryImage = UIImage()
    let categoryImageView = UIImageView()
    let rating = UILabel()
    
    //organizationView
    let logoImageView = UIImageView()
    var logoImage = UIImage()
    var organizationNameLabel = UILabel()
    var summaryTextView = UITextView()
    var priceLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        addSubview(scrollableStackView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.scrollableStackView.addArrangedSubview(collectionView)
        setupNameLabel()
        setupRatingView()
        
        rateView.backgroundColor = .green
        rateView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        scrollableStackView.addArrangedSubview(rateView)
        
        setupTextView()
        descriptionView.backgroundColor = .yellow
        descriptionView.isScrollEnabled = false
        scrollableStackView.addArrangedSubview(descriptionView)
        setupTextViewConstraint()
        
        setupOrganizationView()
        organizationView.backgroundColor = .brown
        organizationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        scrollableStackView.addArrangedSubview(organizationView)
        
        addSubview(letPathView)
        letPathView.addSubview(letPathButton)

    }
    override func setupConstraints() {
        
        super.setupConstraints()
        letPathButton.translatesAutoresizingMaskIntoConstraints = false
        letPathView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            letPathView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            letPathView.leadingAnchor.constraint(equalTo: leadingAnchor),
            letPathView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            letPathButton.bottomAnchor.constraint(equalTo: letPathView.bottomAnchor, constant: -8),
            letPathButton.topAnchor.constraint(equalTo: letPathView.topAnchor, constant: 8),
            letPathButton.leadingAnchor.constraint(equalTo: letPathView.leadingAnchor, constant: 50),
            letPathButton.trailingAnchor.constraint(equalTo: letPathView.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            scrollableStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollableStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollableStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollableStackView.bottomAnchor.constraint(equalTo: letPathView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: scrollableStackView.heightAnchor, multiplier: 0.3)
        ])
        setupConstraintRatingView()
        setupOrganizationViewConstraint()
    
    }
    
    func setupNameLabel() {
        self.letPathButton.setTitle("В путь", for: .normal)
        self.letPathButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)
        self.letPathButton.backgroundColor = UIColor.rgba(0, 122, 255)
        self.letPathButton.setTitleColor(.white, for: .normal)
        self.letPathButton.layer.cornerRadius = 15.0
        self.letPathButton.clipsToBounds = false
        self.letPathButton.addTarget(self, action: #selector(onTapLetPath), for: .touchUpInside)
    }
    
    func setupOrganizationView() {
        organizationView.addSubview(logoImageView)
        organizationView.addSubview(organizationNameLabel)
        organizationView.addSubview(summaryTextView)
        organizationView.addSubview(priceLabel)
        organizationView.addSubview(cosmosView)
        
        logoImageView.image = UIImage(named: "figure.walk")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.layer.borderWidth = 1
        logoImageView.layer.masksToBounds = false
        logoImageView.layer.borderColor = UIColor.black.cgColor
        logoImageView.layer.cornerRadius = logoImageView.frame.height / 2
        logoImageView.clipsToBounds = true
        
        priceLabel.text = "Бесп."
        summaryTextView.text = "akjsandfjknsdfnsdfbsdjfkbhASD"
        summaryTextView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        summaryTextView.textColor = .black
        summaryTextView.isScrollEnabled = false
        
        organizationNameLabel.text = "Организация: SUKA BLYAT"
        organizationNameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        organizationNameLabel.textColor = .yellow
        
        summaryTextView.isEditable = false
        
    }
    func setupOrganizationViewConstraint() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        organizationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryTextView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: organizationView.leadingAnchor, constant: 16),
            logoImageView.topAnchor.constraint(equalTo: organizationView.topAnchor, constant: 16),
            logoImageView.heightAnchor.constraint(equalToConstant: 60),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
            
            organizationNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            organizationNameLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            
            summaryTextView.topAnchor.constraint(equalTo: organizationNameLabel.bottomAnchor, constant: 8),
            summaryTextView.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: organizationNameLabel.bottomAnchor, constant: 8),
            priceLabel.trailingAnchor.constraint(equalTo: organizationView.trailingAnchor, constant: -16),
            summaryTextView.trailingAnchor.constraint(lessThanOrEqualTo: priceLabel.leadingAnchor),
            
            cosmosView.topAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            cosmosView.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 8)
        ])
        summaryTextView.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        priceLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
    func setupRatingView() {
        rateView.addSubview(nameLabel)
        rateView.addSubview(rating)
        rateView.addSubview(categoryImageView)
        
        self.nameLabel.text = "Мурманск"
        self.nameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)
        self.nameLabel.textColor = .black
        
        rating.text = " Рейтинг: \(123123)"
        categoryImageView.image = UIImage(named: "figure.walk")
        
        categoryImageView.contentMode = .scaleAspectFit
    }
    func setupTextView() {
        descriptionView.text = "BKAHSDBHJASBDKJHABSDKHJASBDasdbhahsjdabsdasd"
        descriptionView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    }
    
    func setupTextViewConstraint() {
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: rateView.bottomAnchor, constant: 10),
            descriptionView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -30)
        ])
    }
    
    func setupConstraintRatingView() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        rating.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
    
            nameLabel.leadingAnchor.constraint(equalTo: rateView.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: rateView.topAnchor, constant: 20),
            
            rating.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -4),
            rating.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            
            categoryImageView.trailingAnchor.constraint(equalTo: rateView.trailingAnchor, constant: -20),
            categoryImageView.topAnchor.constraint(equalTo: rateView.topAnchor, constant: 20),
            categoryImageView.heightAnchor.constraint(equalToConstant: 40),
            categoryImageView.widthAnchor.constraint(equalTo: categoryImageView.heightAnchor)
        ])
    }
    @objc func onTapLetPath() {
        print("tapped letPath")
    }
}
extension DetailTourView: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
    }
}
extension DetailTourView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height / 2, height: collectionView.frame.height - 30)
    }
}
