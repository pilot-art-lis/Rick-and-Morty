//
//  MainScreenHeaderView.swift
//  R&M
//
//  Created by Artem on 30/07/2022.
//

import UIKit

class MainScreenHeaderView: UICollectionReusableView {

    static let identifier = "MainScreenHeader"
    
    private var label = UILabel()
    
    public func configure() {
        label.text = "Choose section"
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        label.font = .boldSystemFont(ofSize: 24)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
