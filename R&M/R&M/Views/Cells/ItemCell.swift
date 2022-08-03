//
//  ItemCell.swift
//  R&M
//
//  Created by Artem on 03/08/2022.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    static let identifier = "ItemCell"
    
    public var imageView = UIImageView()
    public var itemLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: contentView.bounds.size.width, height: contentView.bounds.size.height))
        imageView.center.x = contentView.bounds.midX
        imageView.center.y = contentView.bounds.midY
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        itemLabel.frame = CGRect(origin: .zero, size: CGSize(width: contentView.bounds.size.width, height: contentView.bounds.size.height/4))
        itemLabel.center.x = contentView.bounds.midX
        itemLabel.center.y = contentView.bounds.maxY - itemLabel.frame.height/2
        itemLabel.textAlignment = .center
        itemLabel.backgroundColor = .green
        itemLabel.alpha = 0.5
        itemLabel.text = "Text"
        
        imageView.addSubview(itemLabel)
        contentView.addSubview(imageView)
        
        configureConstraints(imageView: imageView, label: itemLabel)
    }
    
    private func configureConstraints(imageView: UIImageView, label: UILabel) {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            label.topAnchor.constraint(lessThanOrEqualTo: contentView.topAnchor, constant: imageView.bounds.height * 0.75),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
