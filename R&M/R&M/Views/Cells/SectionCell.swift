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
    public var button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: contentView.bounds.size.width, height: contentView.bounds.size.height)))
        button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: contentView.bounds.size.width, height: contentView.bounds.size.height)))
        
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
        
        cellView.addSubview(imageView)
        contentView.addSubview(cellView)
        contentView.addSubview(button)
        
        configureConstraints(withView: cellView, imageView: imageView, button: button)
    }
    
    private func configureConstraints(withView view: UIView, imageView: UIImageView, button: UIButton) {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
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
