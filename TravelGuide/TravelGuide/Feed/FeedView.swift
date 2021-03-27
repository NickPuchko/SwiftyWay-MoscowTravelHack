//
//  FeedView.swift
//  TravelGuide
//
//  Created by Николай Пучко on 27.03.2021.
//

import UIKit

class FeedView: UIView {

    init(delegate: FeedViewController) {
        super.init(frame: .zero)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
    }
}
