//
//  CharactersViewController.swift
//  R&M
//
//  Created by Artem on 04/08/2022.
//

import UIKit

class CharacterViewController: UIViewController {

    public var characterTitle = String()
    public var characterImage = UIImageView()
    private var nameLabel = UILabel()
    private var statusLabel = UILabel()
    private var speciesLabel = UILabel()
    private var genderLabel = UILabel()
    private var originLabel = UILabel()
    private var locationLabel = UILabel()
    private var episodeLabel = UILabel()
    private var scrollView = UIScrollView()
    public var loadedLables = [UILabel]()
    
    let interfaceTextAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1),
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22) ]
    let loadedTextAttributes : [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 0.141, green: 0.157, blue: 0.184, alpha: 1)
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))
        
        characterImage.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width - 40, height: view.bounds.size.height/2)
        characterImage.center.x = view.bounds.midX
        characterImage.center.y = view.bounds.midY - view.bounds.midY/2.5
        characterImage.contentMode = .scaleAspectFill
        characterImage.clipsToBounds = true
        characterImage.layer.cornerRadius = 15
        
        nameLabel.frame = CGRect(origin: CGPoint(x: 25, y: 0), size: CGSize(width: 65, height: 22))
        nameLabel.center.y = view.bounds.midY + characterImage.bounds.size.height/5
        nameLabel.attributedText = NSAttributedString(string: "Name:", attributes: interfaceTextAttributes)
        
        statusLabel.frame = CGRect(origin: CGPoint(x: 25, y: 0), size: CGSize(width: 75, height: 22))
        statusLabel.center.y = view.bounds.midY + characterImage.bounds.size.height/5 + 44
        statusLabel.attributedText = NSAttributedString(string: "Status:", attributes: interfaceTextAttributes)
        
        speciesLabel.frame = CGRect(origin: CGPoint(x: 25, y: 0), size: CGSize(width: 90, height: 22))
        speciesLabel.center.y = view.bounds.midY + characterImage.bounds.size.height/5 + 88
        speciesLabel.attributedText = NSAttributedString(string: "Species:", attributes: interfaceTextAttributes)
        
        genderLabel.frame = CGRect(origin: CGPoint(x: 25, y: 0), size: CGSize(width: 80, height: 22))
        genderLabel.center.y = view.bounds.midY + characterImage.bounds.size.height/5 + 132
        genderLabel.attributedText = NSAttributedString(string: "Gender:", attributes: interfaceTextAttributes)
        
        originLabel.frame = CGRect(origin: CGPoint(x: 25, y: 0), size: CGSize(width: 80, height: 22))
        originLabel.center.y = view.bounds.midY + characterImage.bounds.size.height/5 + 176
        originLabel.attributedText = NSAttributedString(string: "Origin:", attributes: interfaceTextAttributes)
        
        locationLabel.frame = CGRect(origin: CGPoint(x: 25, y: 0), size: CGSize(width: 95, height: 22))
        locationLabel.center.y = view.bounds.midY + characterImage.bounds.size.height/5 + 220
        locationLabel.attributedText = NSAttributedString(string: "Location:", attributes: interfaceTextAttributes)
        
        episodeLabel.frame = CGRect(origin: CGPoint(x: 25, y: 0), size: CGSize(width: 90, height: 22))
        episodeLabel.center.y = view.bounds.midY + characterImage.bounds.size.height/5 + 264
        episodeLabel.attributedText = NSAttributedString(string: "Episodes:", attributes: interfaceTextAttributes)
        
        let height = view.frame.minY + episodeLabel.frame.maxY + 30
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: height)

        scrollView.addSubview(characterImage)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(statusLabel)
        scrollView.addSubview(speciesLabel)
        scrollView.addSubview(genderLabel)
        scrollView.addSubview(originLabel)
        scrollView.addSubview(locationLabel)
        scrollView.addSubview(episodeLabel)
        
        for i in 0...6 {
            let label = UILabel()
            loadedLables.append(label)
            scrollView.addSubview(loadedLables[i])
        }
        view.addSubview(scrollView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = characterTitle
        
        let parametersLabels = configureLabels(labels: loadedLables)
        parametersLabels[0].attributedText = NSAttributedString(string: "Morty", attributes: loadedTextAttributes)
        parametersLabels[1].attributedText = NSAttributedString(string: "Alive", attributes: loadedTextAttributes)
        parametersLabels[2].attributedText = NSAttributedString(string: "Human", attributes: loadedTextAttributes)
        parametersLabels[3].attributedText = NSAttributedString(string: "Male", attributes: loadedTextAttributes)
        parametersLabels[4].attributedText = NSAttributedString(string: "Earth", attributes: loadedTextAttributes)
        parametersLabels[5].attributedText = NSAttributedString(string: "Earth", attributes: loadedTextAttributes)
        parametersLabels[6].attributedText = NSAttributedString(string: "1, 2...", attributes: loadedTextAttributes)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        for i in 0...6 {
            loadedLables[i].text = ""
        }
    }
    
    private func configureLabels(labels: [UILabel]) -> [UILabel] {
        var offsetY: CGFloat = 0
        for i in 0..<labels.count {
            labels[i].frame = CGRect(origin: CGPoint(x: 140, y: 0), size: CGSize(width: view.bounds.size.width/2, height: 22))
            labels[i].center.y = view.bounds.midY + characterImage.bounds.size.height/5 + offsetY
            offsetY += 44
        }
        return labels
    }
}
