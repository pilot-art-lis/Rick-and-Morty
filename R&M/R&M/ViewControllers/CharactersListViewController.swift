//
//  ItemsListViewController.swift
//  R&M
//
//  Created by Artem on 01/08/2022.
//

import Foundation
import UIKit
import Combine
import RickMortySwiftApi

class CharactersListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    static let identifier = "ItemsListViewController"
    public var sectionTitle = ""
    private var collectionView: UICollectionView { return view as! UICollectionView }
    private let searchBar = UISearchController()
    private let choosedCharactersViewController = CharacterViewController()
    
    override func loadView() {
        view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.hidesNavigationBarDuringPresentation = true
        navigationItem.searchController = searchBar
        collectionView.backgroundColor = UIColor.init(red: 0.141, green: 0.157, blue: 0.184, alpha: 1)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.identifier)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "FilterIcon"), style: .plain, target: self, action: #selector(filterTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = sectionTitle
    }
    
    @objc func filterTapped() {
        let filterViewController = FilterViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(filterViewController, animated: true)
    }
    
    //UICollectionViewDataSource protocol implementation
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        cell.layer.cornerRadius = 15
        
        let textAttributes : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22) ]
        
        let attributedText = NSAttributedString(string: "Text", attributes: textAttributes)
        cell.itemLabel.attributedText = attributedText
        
        if indexPath.row == 0 {
            cell.imageView.image = UIImage(named: "Morty")
            let attributedText = NSAttributedString(string: "Morty", attributes: textAttributes)
            cell.itemLabel.attributedText = attributedText
        }
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout protocol implementation
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/2 - 30, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 30, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! ItemCell
        choosedCharactersViewController.characterTitle = selectedCell.itemLabel.text ?? ""
        navigationItem.backButtonTitle = ""
        choosedCharactersViewController.characterImage.image = selectedCell.imageView.image
        navigationController?.pushViewController(choosedCharactersViewController, animated: true)
    }
}
