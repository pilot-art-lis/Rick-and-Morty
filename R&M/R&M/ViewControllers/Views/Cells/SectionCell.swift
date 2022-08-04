//
//  SectionCell.swift
//  R&M
//
//  Created by Artem on 30/07/2022.
//

import UIKit

class SectionCell: UICollectionViewCell {
    
    static let identifier = "SectionCell"
    public var imageView = UIImageView()
    public var sectionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: contentView.bounds.size.width, height: contentView.bounds.size.height))
        imageView.center = contentView.center
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        sectionLabel.frame = CGRect(origin: .zero, size: CGSize(width: contentView.bounds.size.width, height: contentView.bounds.size.height))
        sectionLabel.center = contentView.center
        sectionLabel.textAlignment = .center
        sectionLabel.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        imageView.addSubview(sectionLabel)
        contentView.addSubview(imageView)
        
        configureConstraints(imageView: imageView, label: sectionLabel)
    }
    
    private func configureConstraints(imageView: UIImageView, label: UILabel) {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
