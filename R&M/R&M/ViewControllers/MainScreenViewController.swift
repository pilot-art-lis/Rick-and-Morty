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
        
        title = "Choose section"
        navigationController?.navigationBar.standardAppearance = configureNavigationBarAppearance()
        
        collectionView.backgroundColor = UIColor.init(red: 0.141, green: 0.157, blue: 0.184, alpha: 1)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SectionCell.self, forCellWithReuseIdentifier: SectionCell.identifier)
    }
    
    private func configureNavigationBarAppearance() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        //To make navigation bar bottom border invisible
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.init(red: 0.141, green: 0.157, blue: 0.184, alpha: 1)
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1),
            .font: UIFont.boldSystemFont(ofSize: 24)
        ]
        return appearance
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
        cell.button.setAttributedTitle(chooseImageAndTextForSection(indexPath: indexPath).0, for: .normal)
        cell.imageView.image = chooseImageAndTextForSection(indexPath: indexPath).1
        cell.button.addTarget(self, action: #selector(sectionChoosed), for: .touchUpInside)
        return cell
    }
    
    private func chooseImageAndTextForSection(indexPath: IndexPath) -> (NSAttributedString, UIImage) {
        var sectionText: String {
            switch indexPath.row {
            case 0:
                return "Characters"
            case 1:
                return "Locations"
            case 2:
                return "Episodes"
            default:
                return "Text"
            }
        }
        
        let textAttributes : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22) ]
        
        let attributedText = NSAttributedString(string: sectionText, attributes: textAttributes)
        
        var sectionImage: UIImage {
            switch indexPath.row {
            case 0:
                return UIImage(named: "CharactersSectionImage") ?? UIImage()
            case 1:
                return UIImage(named: "LocationsSectionImage") ?? UIImage()
            case 2:
                return UIImage(named: "EpisodesSectionImage") ?? UIImage()
            default:
                return UIImage()
            }
        }
        return (attributedText, sectionImage)
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
    
    //When tapped on the section
    @objc func sectionChoosed() {
        let choosedSectionViewController = ItemsListViewController()
        navigationController?.pushViewController(choosedSectionViewController, animated: true)
    }
}



