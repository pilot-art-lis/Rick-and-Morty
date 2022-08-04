//
//  EpisodesViewController.swift
//  R&M
//
//  Created by Artem on 04/08/2022.
//

import UIKit

class EpisodesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.init(red: 0.141, green: 0.157, blue: 0.184, alpha: 1)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "FilterIcon"), style: .plain, target: self, action: #selector(filterTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Episodes"
    }
    
    @objc func filterTapped() {
        let filterViewController = FilterViewController()
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(filterViewController, animated: true)
    }
}
