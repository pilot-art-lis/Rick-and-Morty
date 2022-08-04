//
//  FilterViewController.swift
//  R&M
//
//  Created by Artem on 03/08/2022.
//

import UIKit

class FilterViewController: UIViewController {

    private let statusLabel = UILabel()
    private var aliveLabel = UILabel()
    private var deadLabel = UILabel()
    private var unknownStatusLabel = UILabel()
    private let genderLabel = UILabel()
    private var femaleLabel = UILabel()
    private var maleLabel = UILabel()
    private var genderlessLabel = UILabel()
    private var unknownGenderLabel = UILabel()
    
    private var aliveFilterButton = UIButton()
    private var deadFilterButton = UIButton()
    private var unknownStatusFilterButton = UIButton()
    private var femaleFilterButton = UIButton()
    private var maleFilterButton = UIButton()
    private var genderlessFilterButton = UIButton()
    private var unknownGenderFilterButton = UIButton()
    
    let notCheckedTextAttributes : [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.141, green: 0.157, blue: 0.184, alpha: 1)
        
        configureButtons()
        
        statusLabel.frame = CGRect(x: 30, y: 120, width: 110, height: 22)
        statusLabel.font = UIFont.boldSystemFont(ofSize: 22)
        statusLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        statusLabel.text = "Status"
        
        let statusLabels = configureLabels(labels: [aliveLabel, deadLabel, unknownStatusLabel], offsetY: 120)
        statusLabels[0].text = "Alive"
        statusLabels[1].text = "Dead"
        statusLabels[2].text = "Unknown"
        
        genderLabel.frame = CGRect(x: 30, y: 360, width: 110, height: 22)
        genderLabel.font = UIFont.boldSystemFont(ofSize: 22)
        genderLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        genderLabel.text = "Gender"
        
        let genderLabels = configureLabels(labels: [femaleLabel, maleLabel, genderlessLabel, unknownGenderLabel], offsetY: 360)
        genderLabels[0].text = "Female"
        genderLabels[1].text = "Male"
        genderLabels[2].text = "Genderless"
        genderLabels[3].text = "Unknown"
        
        for i in 0..<statusLabels.count {
            view.addSubview(statusLabels[i])
        }
        
        for i in 0..<genderLabels.count {
            view.addSubview(genderLabels[i])
        }
        
        view.addSubview(statusLabel)
        view.addSubview(genderLabel)

        view.addSubview(aliveFilterButton)
        view.addSubview(deadFilterButton)
        view.addSubview(unknownStatusFilterButton)
        view.addSubview(femaleFilterButton)
        view.addSubview(maleFilterButton)
        view.addSubview(genderlessFilterButton)
        view.addSubview(unknownGenderFilterButton)
    }
    
    private func configureLabels(labels: [UILabel], offsetY: Int) -> [UILabel] {
        var newLabels: [UILabel] = []
        var offset = offsetY
        for label in labels {
            offset += 40
            label.frame = CGRect(x: 80, y: offset, width: 110, height: 22)
            label.font = UIFont.systemFont(ofSize: 22)
            label.textColor = .white
            newLabels.append(label)
        }
        return newLabels
    }
    
    private func configureButtons() {
        aliveFilterButton.frame = CGRect(x: 30, y: 160, width: 22, height: 22)
        aliveFilterButton.backgroundColor = .white
        aliveFilterButton.layer.cornerRadius = 11
        aliveFilterButton.addTarget(self, action: #selector(pressAliveButton), for: .touchUpInside)

        deadFilterButton.frame = CGRect(x: 30, y: 200, width: 22, height: 22)
        deadFilterButton.backgroundColor = .white
        deadFilterButton.layer.cornerRadius = 11
        deadFilterButton.addTarget(self, action: #selector(pressDeadButton), for: .touchUpInside)

        unknownStatusFilterButton.frame = CGRect(x: 30, y: 240, width: 22, height: 22)
        unknownStatusFilterButton.backgroundColor = .white
        unknownStatusFilterButton.layer.cornerRadius = 11
        unknownStatusFilterButton.addTarget(self, action: #selector(pressUnknownStatusButton), for: .touchUpInside)

        femaleFilterButton.frame = CGRect(x: 30, y: 400, width: 22, height: 22)
        femaleFilterButton.backgroundColor = .white
        femaleFilterButton.layer.cornerRadius = 11
        femaleFilterButton.addTarget(self, action: #selector(pressFemaleButton), for: .touchUpInside)

        maleFilterButton.frame = CGRect(x: 30, y: 440, width: 22, height: 22)
        maleFilterButton.backgroundColor = .white
        maleFilterButton.layer.cornerRadius = 11
        maleFilterButton.addTarget(self, action: #selector(pressMaleButton), for: .touchUpInside)

        genderlessFilterButton.frame = CGRect(x: 30, y: 480, width: 22, height: 22)
        genderlessFilterButton.backgroundColor = .white
        genderlessFilterButton.layer.cornerRadius = 11
        genderlessFilterButton.addTarget(self, action: #selector(pressGenderlessButton), for: .touchUpInside)

        unknownGenderFilterButton.frame = CGRect(x: 30, y: 520, width: 22, height: 22)
        unknownGenderFilterButton.backgroundColor = .white
        unknownGenderFilterButton.layer.cornerRadius = 11
        unknownGenderFilterButton.addTarget(self, action: #selector(pressUnknownGenderButton), for: .touchUpInside)
    }
    
    @objc func pressAliveButton() {
        aliveFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        aliveLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
    }
    
    @objc func pressDeadButton() {
        deadFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        deadLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
    }
    
    @objc func pressUnknownStatusButton() {
        unknownStatusFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        unknownStatusLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
    }
    
    @objc func pressFemaleButton() {
        femaleFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        femaleLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
    }
    
    @objc func pressMaleButton() {
        maleFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        maleLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
    }
    
    @objc func pressGenderlessButton() {
        genderlessFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        genderlessLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
    }
    
    @objc func pressUnknownGenderButton() {
        unknownGenderFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        unknownGenderLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Filter"
    }
}
