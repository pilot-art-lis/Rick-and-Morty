//
//  SectionCell.swift
//  R&M
//
//  Created by Artem on 30/07/2022.
//

import UIKit

class SectionCell: UICollectionViewCell {
    
    static let identifier = "SectionCell"
    private var cellView = UIView()
    public var imageView = UIImageView()
    public var sectionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: contentView.bounds.size.width, height: contentView.bounds.size.height)))
        
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        
        cellView.center = contentView.center
        
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: cellView.bounds.size.width, height: cellView.bounds.size.height))
        imageView.center.x = cellView.bounds.midX
        imageView.center.y = cellView.bounds.midY
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.alpha = 0.5
        
        sectionLabel.frame = CGRect(origin: .zero, size: CGSize(width: cellView.bounds.size.width, height: cellView.bounds.size.height))
        sectionLabel.center = cellView.center
        sectionLabel.textAlignment = .center
        
        cellView.addSubview(imageView)
        cellView.addSubview(sectionLabel)
        contentView.addSubview(cellView)
        
        configureConstraints(withView: cellView, imageView: imageView, label: sectionLabel)
    }
    
    private func configureConstraints(withView view: UIView, imageView: UIImageView, label: UILabel) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
