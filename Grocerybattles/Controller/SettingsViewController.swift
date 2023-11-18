//
//  SettingsViewController.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import UIKit

final class SettingsViewController: UIViewController {

    private let settingsView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    private func configure() {
        setupView()
        addTargets()
    }
    
    private func setupView() {
        view.addSubview(settingsView)
        settingsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func addTargets() {
        settingsView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        settingsView.brightnessSlider.addTarget(self, action: #selector(brightnessSliderValueChanged(_:)), for: .valueChanged)
        settingsView.soundSlider.addTarget(self, action: #selector(soundSliderValueChanged(_:)), for: .valueChanged)

    }
}

private extension SettingsViewController {
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func soundSliderValueChanged(_ sender: UISlider) {
        if sender.value == 0 {
            self.settingsView.soundOffImage.isHidden = false
        } else {
            self.settingsView.soundOffImage.isHidden = true
        }
        
        MainViewController.backgroundMusic?.volume = sender.value
    }
    
    @objc func brightnessSliderValueChanged(_ sender: UISlider) {
        let brightness = sender.value
        UIScreen.main.brightness = CGFloat(brightness) 
        print(brightness)
    }

}
