//
//  ViewController.swift
//  R&M
//
//  Created by Artem on 27/07/2022.
//

import UIKit

class MainScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView { return view as! UICollectionView }
    
    override func loadView() {
        view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.init(red: 0.141, green: 0.157, blue: 0.184, alpha: 1)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SectionCell.self, forCellWithReuseIdentifier: SectionCell.identifier)
        collectionView.register(MainScreenHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainScreenHeaderView.identifier)
    }
    
    //UICollectionViewDataSource protocol implementation
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return configureCell(cellForItemAt: indexPath)
    }
    
    private func configureCell(cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionCell.identifier, for: indexPath) as! SectionCell
        cell.layer.cornerRadius = 15
        switch indexPath.row {
        case 0:
            cell.textLabel.text = "Characters"
            cell.imageView.image = UIImage(named: "CharactersSectionImage")
        case 1:
            cell.textLabel.text = "Locations"
            cell.imageView.image = UIImage(named: "LocationsSectionImage")
        case 2:
            cell.textLabel.text = "Episodes"
            cell.imageView.image = UIImage(named: "EpisodesSectionImage")
        default:
            cell.textLabel.text = "Text"
        }
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout protocol implementation
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width - 60, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 0, bottom: 30, right: 0)
    }
    
    //Setting a header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainScreenHeaderView.identifier, for: indexPath) as! MainScreenHeaderView
        
        header.configure()
        return header
    }
    
    //Setting a header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 35)
    }

}



