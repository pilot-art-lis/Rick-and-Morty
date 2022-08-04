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
    
    private let resetStatusButton = UIButton()
    private let resetGenderButton = UIButton()
    private let applyFiltersButton = UIButton()
    
    private var scrollView = UIScrollView()
    
    let notCheckedTextAttributes : [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.141, green: 0.157, blue: 0.184, alpha: 1)
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height - 100))
        
        configureFilterButtons()
        configureResetButton(button: resetStatusButton, offsetY: 120)
        configureResetButton(button: resetGenderButton, offsetY: 360)
        resetStatusButton.addTarget(self, action: #selector(resetStatusFilter), for: .touchUpInside)
        resetGenderButton.addTarget(self, action: #selector(resetGenderFilter), for: .touchUpInside)
        
        applyFiltersButton.frame = CGRect(x: 0, y: Int(view.frame.size.height) - 80, width: Int(view.bounds.size.width) - 50, height: 50)
        applyFiltersButton.center.x = view.center.x
        applyFiltersButton.titleLabel?.font = .boldSystemFont(ofSize: 22)
        applyFiltersButton.titleLabel?.textAlignment = .center
        applyFiltersButton.setTitle("Apply filters", for: .normal)
        applyFiltersButton.setTitleColor(UIColor(named: "AccentColor"), for: .normal)
        applyFiltersButton.layer.borderWidth = 1
        applyFiltersButton.layer.borderColor = CGColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        applyFiltersButton.layer.cornerRadius = 15
        applyFiltersButton.addTarget(self, action: #selector(applyFilters), for: .touchUpInside)
        
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
            scrollView.addSubview(statusLabels[i])
        }
        
        for i in 0..<genderLabels.count {
            scrollView.addSubview(genderLabels[i])
        }
        
        let height = view.frame.minY + unknownGenderLabel.frame.maxY + 30
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: height)
        
        scrollView.addSubview(statusLabel)
        scrollView.addSubview(genderLabel)

        scrollView.addSubview(resetStatusButton)
        scrollView.addSubview(resetGenderButton)
        scrollView.addSubview(aliveFilterButton)
        scrollView.addSubview(deadFilterButton)
        scrollView.addSubview(unknownStatusFilterButton)
        scrollView.addSubview(femaleFilterButton)
        scrollView.addSubview(maleFilterButton)
        scrollView.addSubview(genderlessFilterButton)
        scrollView.addSubview(unknownGenderFilterButton)
        view.addSubview(scrollView)
        view.addSubview(applyFiltersButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "Filter"
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
    
    private func configureFilterButtons() {
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
    
    private func configureResetButton(button: UIButton, offsetY: Int) {
        button.frame = CGRect(x: Int(view.frame.maxX) - 110, y: offsetY, width: 110, height: 25)
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.titleLabel?.textAlignment = .center
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(UIColor(named: "ResetButtonInactive"), for: .normal)
        button.isEnabled = false
    }
    
    private func activateResetButton(button: UIButton) {
        button.isEnabled = true
        button.setTitleColor(UIColor(named: "ResetButtonActive"), for: .normal)
    }
    
    @objc func pressAliveButton() {
        aliveFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        aliveLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        activateResetButton(button: resetStatusButton)
    }
    
    @objc func pressDeadButton() {
        deadFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        deadLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        activateResetButton(button: resetStatusButton)
    }
    
    @objc func pressUnknownStatusButton() {
        unknownStatusFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        unknownStatusLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        resetStatusButton.isEnabled = true
        resetStatusButton.setTitleColor(.systemRed, for: .normal)
    }
    
    @objc func pressFemaleButton() {
        femaleFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        femaleLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        activateResetButton(button: resetGenderButton)
    }
    
    @objc func pressMaleButton() {
        maleFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        maleLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        activateResetButton(button: resetGenderButton)
    }
    
    @objc func pressGenderlessButton() {
        genderlessFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        genderlessLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        activateResetButton(button: resetGenderButton)
    }
    
    @objc func pressUnknownGenderButton() {
        unknownGenderFilterButton.backgroundColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        unknownGenderLabel.textColor = UIColor(red: 0.741, green: 0.851, blue: 0.318, alpha: 1)
        activateResetButton(button: resetGenderButton)
    }
    
    @objc func resetStatusFilter() {
        aliveLabel.textColor = .white
        deadLabel.textColor = .white
        unknownStatusLabel.textColor = .white
        
        aliveFilterButton.backgroundColor = .white
        deadFilterButton.backgroundColor = .white
        unknownStatusFilterButton.backgroundColor = .white
        
        resetStatusButton.setTitleColor(UIColor(named: "ResetButtonInactive"), for: .normal)
        resetStatusButton.isEnabled = false
    }
    
    @objc func resetGenderFilter() {
        femaleLabel.textColor = .white
        maleLabel.textColor = .white
        genderlessLabel.textColor = .white
        unknownGenderLabel.textColor = .white
        
        femaleFilterButton.backgroundColor = .white
        maleFilterButton.backgroundColor = .white
        genderlessFilterButton.backgroundColor = .white
        unknownGenderFilterButton.backgroundColor = .white
        
        resetGenderButton.setTitleColor(UIColor(named: "ResetButtonInactive"), for: .normal)
        resetGenderButton.isEnabled = false
    }
    
    @objc func applyFilters() {
        let n: Int! = self.navigationController?.viewControllers.count
        navigationController?.popToViewController(navigationController?.viewControllers[n-2] ?? MainScreenViewController(), animated: true)
    }
}
