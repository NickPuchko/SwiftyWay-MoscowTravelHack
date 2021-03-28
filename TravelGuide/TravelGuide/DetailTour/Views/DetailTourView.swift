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
    
    var didTapContinue: () -> Void
    
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
        cv.backgroundColor = .white
        
        return cv
    }()
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.settings.starSize = 30
        return view
    }()
    let separateView1 = UIView()
    let separateView2 = UIView()
    let separateView3 = UIView()
    let rateView = UIView()
    let descriptionView = UITextView()
    let letPathView = UIView()
    let letPathButton = UIButton(type: .system)
    let organizationView = UIView()
    
    //rateView
    let nameLabel = UILabel()
    let categoryImage = UIImage()
    let categoryImageView = UIImageView()
    //let rating = UILabel()
    
    //organizationView
    let logoImageView = UIImageView()
    var logoImage = UIImage(systemName: "person.3")
    var organizationNameLabel = UILabel()
    var summaryTextView = UITextView()
    var priceLabel = UILabel()
    
    init(handleContinue: @escaping () -> Void) {
        didTapContinue = handleContinue
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
        setupSeparatesViews()
        scrollableStackView.addArrangedSubview(collectionView)
        scrollableStackView.addArrangedSubview(separateView1)
        setupNameLabel()
        setupRatingView()
        rateView.backgroundColor = .white
        rateView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        scrollableStackView.addArrangedSubview(rateView)
        
        setupTextView()
        descriptionView.backgroundColor = .white
        descriptionView.isScrollEnabled = false
        scrollableStackView.addArrangedSubview(descriptionView)
        scrollableStackView.addArrangedSubview(separateView2)
        setupTextViewConstraint()
        
        setupOrganizationView()
        organizationView.backgroundColor = .white
        organizationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        scrollableStackView.addArrangedSubview(organizationView)
        scrollableStackView.addArrangedSubview(separateView3)
        
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
        setupSeparateViewConstraint()
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
        
        logoImageView.image = logoImage
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.layer.cornerRadius = 10
        logoImageView.clipsToBounds = true
        
        priceLabel.text = "Бесплатно"
        summaryTextView.text = "akjsandfjknsdfnsdfbsdjfkbhASDajsdasdjkasdjkhasdkjajsdnfjkasldfnjkalsdnfjklasndfjkasndflk"
        summaryTextView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        summaryTextView.textColor = .black
        summaryTextView.isScrollEnabled = false
        
        organizationNameLabel.text = "Организация: SUKA BLYAT"
        organizationNameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        organizationNameLabel.textColor = .black
        
        summaryTextView.isEditable = false
        
    }
    func setupSeparatesViews() {
        separateView1.backgroundColor = .systemGray6
        separateView2.backgroundColor = .systemGray6
        separateView3.backgroundColor = .systemGray6
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
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
            
            organizationNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 12),
            organizationNameLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            
            summaryTextView.topAnchor.constraint(equalTo: organizationNameLabel.bottomAnchor, constant: 8),
            summaryTextView.leadingAnchor.constraint(equalTo: scrollableStackView.leadingAnchor, constant: 30),
            summaryTextView.trailingAnchor.constraint(equalTo: scrollableStackView.trailingAnchor, constant: -30),
            
            cosmosView.topAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            cosmosView.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 8),
            
            priceLabel.topAnchor.constraint(equalTo: cosmosView.topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: organizationView.trailingAnchor, constant: -16),
            
        
        ])
        summaryTextView.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
        priceLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
    func setupSeparateViewConstraint(){
        separateView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separateView1.widthAnchor.constraint(equalTo: collectionView.widthAnchor),
            separateView1.heightAnchor.constraint(equalToConstant: 12),
            
            separateView2.widthAnchor.constraint(equalTo: collectionView.widthAnchor),
            separateView2.heightAnchor.constraint(equalToConstant: 12),
            
            separateView3.widthAnchor.constraint(equalTo: collectionView.widthAnchor),
            separateView3.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    func setupRatingView() {
        rateView.addSubview(nameLabel)
        //rateView.addSubview(rating)
        rateView.addSubview(categoryImageView)
        
        self.nameLabel.text = "Мурманск"
        self.nameLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 22)
        self.nameLabel.textColor = .black
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.numberOfLines = 2
        
//        rating.text = " Рейтинг: \(123123)"
//        rating.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 18)
        categoryImageView.image = UIImage(systemName: "figure.walk")
        
        categoryImageView.contentMode = .scaleAspectFit
    }
    func setupTextView() {
        descriptionView.text = "BKAHSDBHJASBDKJHABSDKHJASBDasdbhahsjdabsdasdnasldnfsdlfnlsakjdfnksadfnljk"
        descriptionView.font = UIFont(name: "AppleSDGothicNeo-Light", size: 14)
        descriptionView.isEditable = false
    }
    
    func setupTextViewConstraint() {
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionView.leadingAnchor.constraint(equalTo: scrollableStackView.leadingAnchor, constant: 30),
            descriptionView.trailingAnchor.constraint(equalTo: scrollableStackView.trailingAnchor, constant: -30)
        ])
    }
    
    func setupConstraintRatingView() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
    
            nameLabel.leadingAnchor.constraint(equalTo: rateView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: categoryImageView.leadingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: rateView.topAnchor, constant: 20),
            
            categoryImageView.trailingAnchor.constraint(equalTo: rateView.trailingAnchor, constant: -20),
            categoryImageView.topAnchor.constraint(equalTo: rateView.topAnchor, constant: 20),
            categoryImageView.heightAnchor.constraint(equalToConstant: 40),
            categoryImageView.widthAnchor.constraint(equalTo: categoryImageView.heightAnchor)
        ])
    }
    @objc func onTapLetPath() {
        didTapContinue()
    }
}
extension DetailTourView: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
    }
}
extension DetailTourView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
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
