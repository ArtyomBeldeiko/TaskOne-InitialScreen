//
//  WelcomeViewController.swift
//  ClevertechTaskOne
//
//  Created by Artyom Beldeiko on 8.12.22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "userInterfaceColor")
        label.font = .systemFont(ofSize: 32, weight: .medium)
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chooseLanguageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "userInterfaceColor")
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "Choose your language"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let languagePicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.tintColor = UIColor(named: "userInterfaceColor")
        pickerView.layer.borderColor = UIColor(named: "userInterfaceColor")?.cgColor
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    private let lightModeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "sun.min.fill"), for: .normal)
        button.tintColor = UIColor(named: "userInterfaceColor")
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "userInterfaceColor")?.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(initiateLightMode), for: .touchUpInside)
        return button
    }()
    
    private let darkModeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "moon.fill"), for: .normal)
        button.tintColor = UIColor(named: "userInterfaceColor")
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "userInterfaceColor")?.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(initiateDarkMode), for: .touchUpInside)
        return button
    }()
    
    private let autoModeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "clock.arrow.2.circlepath"), for: .normal)
        button.tintColor = .red
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "userInterfaceColor")?.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(initiateDeviceMode), for: .touchUpInside)
        return button
    }()
    
//    MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setConstraints()
        configureLanguagePickerView()
    }
    
//    MARK: - viewDidLayoutSubviews
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setCornerRadius()
    }
    
//    MARK: - traitCollectionDidChange
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        setBorderColor()
    }
    
    private func setView() {
        view.addSubview(backgroundView)
        view.addSubview(welcomeLabel)
        view.addSubview(chooseLanguageLabel)
        view.addSubview(languagePicker)
        view.addSubview(lightModeButton)
        view.addSubview(darkModeButton)
        view.addSubview(autoModeButton)
    }
    
    private func setConstraints() {
        let backgroundViewContraints = [
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
        
        let welcomeLabelContraints = [
            welcomeLabel.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -240),
            welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        
        let languagePickerConstraints = [
            languagePicker.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 15),
            languagePicker.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -100),
            languagePicker.heightAnchor.constraint(equalToConstant: 150),
            languagePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ]
        
        let chooseLanguageLabelConstraints = [
            chooseLanguageLabel.bottomAnchor.constraint(equalTo: languagePicker.topAnchor, constant: 10),
            chooseLanguageLabel.leadingAnchor.constraint(equalTo: languagePicker.leadingAnchor, constant: 8)
        ]
        
        let lightModeButtonConstraints = [
            lightModeButton.widthAnchor.constraint(equalToConstant: 50),
            lightModeButton.heightAnchor.constraint(equalToConstant: 50),
            lightModeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            lightModeButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30)
        ]
        
        let darkModeButtonConstraints = [
            darkModeButton.widthAnchor.constraint(equalToConstant: 50),
            darkModeButton.heightAnchor.constraint(equalToConstant: 50),
            darkModeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            darkModeButton.topAnchor.constraint(equalTo: lightModeButton.bottomAnchor, constant: 12)
        ]
        
        let autoModeButtonConstraints = [
            autoModeButton.widthAnchor.constraint(equalToConstant: 50),
            autoModeButton.heightAnchor.constraint(equalToConstant: 50),
            autoModeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            autoModeButton.topAnchor.constraint(equalTo: darkModeButton.bottomAnchor, constant: 12)
        ]
        
        NSLayoutConstraint.activate(backgroundViewContraints)
        NSLayoutConstraint.activate(welcomeLabelContraints)
        NSLayoutConstraint.activate(languagePickerConstraints)
        NSLayoutConstraint.activate(chooseLanguageLabelConstraints)
        NSLayoutConstraint.activate(lightModeButtonConstraints)
        NSLayoutConstraint.activate(darkModeButtonConstraints)
        NSLayoutConstraint.activate(autoModeButtonConstraints)
    }
    
    private func setBorderColor() {
        lightModeButton.layer.borderColor = UIColor(named: "userInterfaceColor")?.cgColor
        darkModeButton.layer.borderColor = UIColor(named: "userInterfaceColor")?.cgColor
        autoModeButton.layer.borderColor = UIColor(named: "userInterfaceColor")?.cgColor
        languagePicker.layer.borderColor = UIColor(named: "userInterfaceColor")?.cgColor
    }
    
    private func setCornerRadius() {
        lightModeButton.layer.cornerRadius = lightModeButton.frame.width / 2
        darkModeButton.layer.cornerRadius = darkModeButton.frame.width / 2
        autoModeButton.layer.cornerRadius = darkModeButton.frame.width / 2
    }
    
    private func configureLanguagePickerView() {
        languagePicker.delegate = self
        languagePicker.dataSource = self
        languagePicker.selectRow(1, inComponent: 0, animated: false)
    }
    
    @objc private func initiateLightMode(sender: UIButton) {
        overrideUserInterfaceStyle = .light
        sender.tintColor = .red
        darkModeButton.tintColor = UIColor(named: "userInterfaceColor")
        autoModeButton.tintColor = UIColor(named: "userInterfaceColor")
    }
    
    @objc private func initiateDarkMode(sender: UIButton) {
        overrideUserInterfaceStyle = .dark
        sender.tintColor = .red
        lightModeButton.tintColor = UIColor(named: "userInterfaceColor")
        autoModeButton.tintColor = UIColor(named: "userInterfaceColor")
    }
    
    @objc private func initiateDeviceMode(sender: UIButton) {
        overrideUserInterfaceStyle = .unspecified
        sender.tintColor = .red
        lightModeButton.tintColor = UIColor(named: "userInterfaceColor")
        darkModeButton.tintColor = UIColor(named: "userInterfaceColor")
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource

extension WelcomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    
    
}
