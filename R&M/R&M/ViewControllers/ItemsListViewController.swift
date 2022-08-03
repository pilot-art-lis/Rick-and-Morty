//
//  ItemsListViewController.swift
//  R&M
//
//  Created by Artem on 01/08/2022.
//

import UIKit

class ItemsListViewController: UIViewController {

    static let identifier = "ItemsListViewController"
    public var sectionTitle = ""
    private var collectionView: UICollectionView { return view as! UICollectionView }
    
    override func loadView() {
        view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.init(red: 0.141, green: 0.157, blue: 0.184, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = sectionTitle
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
