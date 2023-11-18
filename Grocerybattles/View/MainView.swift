//
//  MainView.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import Foundation
import UIKit

final class MainView: UIView {
    
    private let background = UIImageView(image: UIImage(named: "mainBackground"))
    
    public let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "playButton"), for: .normal)
        return button
    }()
    
    public let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "settingsButton"), for: .normal)
        return button
    }()
    
    public let shopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "shopButton"), for: .normal)
        return button
    }()
    
    public let statisticsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "statisticsButton"), for: .normal)
        return button
    }()
    
    public let topButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "topButton"), for: .normal)
        return button
    }()
    
    private let sv1: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 14
        sv.axis = .horizontal
        return sv
    }()
    
    private let sv2: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 14
        sv.axis = .horizontal
        return sv
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
        addSubview(playButton)
        addSubview(settingsButton)
        addSubview(shopButton)
        addSubview(statisticsButton)
        addSubview(topButton)
    }
    
    private func setupConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        [statisticsButton, topButton, settingsButton, shopButton].forEach {
            $0.snp.makeConstraints { make in
                make.width.equalTo(126)
                make.height.equalTo(103)
            }
        }
        
        statisticsButton.snp.makeConstraints { make in
            make.height.equalTo(104)
            make.top.equalToSuperview().offset(125)
            make.trailing.equalTo(snp.centerX).inset(7)
        }
        
        topButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(125)
            make.leading.equalTo(snp.centerX).offset(7)
        }
        
        settingsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(218)
            make.trailing.equalTo(statisticsButton.snp.trailing)
        }
        
        shopButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(218)
            make.leading.equalTo(topButton.snp.leading)
        }
        
        playButton.snp.makeConstraints { make in
            make.width.equalTo(187)
            make.height.equalTo(153)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(314)
        }  
    }
}
