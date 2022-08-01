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
    public var textLabel = UILabel()
    
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
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textAlignment = .center
        textLabel.font = .boldSystemFont(ofSize: 22)
        
        cellView.addSubview(imageView)
        cellView.addSubview(textLabel)
        contentView.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
