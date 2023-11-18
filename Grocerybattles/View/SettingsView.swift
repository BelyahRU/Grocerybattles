//
//  SettingsView.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import UIKit

final class SettingsView: UIView {

    private let background = UIImageView(image: UIImage(named: "settingsBackground"))
    
    private let soundAvocadoImage = UIImageView(image: UIImage(named: "avocado"))
    
    private let screenAvocadoImage = UIImageView(image: UIImage(named: "avocado"))
    
    public let soundOffImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cross")
        image.isHidden = true
        return image
    }()
    
    public let soundSlider: CustomSlider = {
        let slider = CustomSlider()
        slider.value = 0.5
        return slider
    }()
    public let brightnessSlider: CustomSlider = {
        let slider = CustomSlider()
        slider.value = 0.5
        return slider
    }()
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    private let soundLabel: UILabel = {
        let label = UILabel()
        label.text = "sound"
        label.textColor = .white
        label.font = UIFont(name: "Coiny-Regular", size: 33)
        return label
    }()
    
    private let screenLabel: UILabel = {
        let label = UILabel()
        label.text = "screen"
        label.textColor = .white
        label.font = UIFont(name: "Coiny-Regular", size: 33)
        return label
    }()
    
    private let brightnessLabel: UILabel = {
        let label = UILabel()
        label.text = "brightness"
        label.textColor = .white
        label.font = UIFont(name: "Coiny-Regular", size: 33)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(background)
        addSubview(backButton)
        addSubview(soundSlider)
        addSubview(soundLabel)
        addSubview(screenLabel)
        addSubview(brightnessLabel)
        addSubview(brightnessSlider)
        addSubview(soundAvocadoImage)
        addSubview(screenAvocadoImage)
        addSubview(soundOffImage)
    }
    
    private func setupConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        soundLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(soundSlider.snp.top).inset(-8)
        }
        
        soundSlider.snp.makeConstraints { make in
            make.width.equalTo(215)
            make.height.equalTo(30)
            make.top.equalToSuperview().offset(240/852*UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
        }
        
        screenLabel.snp.makeConstraints { make in
            make.top.equalTo(soundSlider.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        brightnessLabel.snp.makeConstraints { make in
            make.top.equalTo(screenLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        brightnessSlider.snp.makeConstraints { make in
            make.width.equalTo(215)
            make.height.equalTo(30)
            make.top.equalTo(brightnessLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        soundAvocadoImage.snp.makeConstraints { make in
            make.centerY.equalTo(soundLabel.snp.centerY)
            make.trailing.equalTo(soundLabel.snp.leading).inset(-5)
            make.width.equalTo(21.9)
            make.height.equalTo(29.1)
        }
        
        screenAvocadoImage.snp.makeConstraints { make in
            make.centerY.equalTo(screenLabel.snp.centerY)
            make.trailing.equalTo(screenLabel.snp.leading).inset(-5)
            make.width.equalTo(21.9)
            make.height.equalTo(29.1)
        }
        
        soundOffImage.snp.makeConstraints { make in
            make.centerY.equalTo(soundSlider.snp.centerY)
            make.leading.equalTo(soundSlider.snp.trailing).offset(4)
        }
    }
    
}
