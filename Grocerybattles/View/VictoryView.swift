//
//  VictoryView.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 29.08.2023.
//

import UIKit

final class VictoryView: UIView {
    
    private let background = UIImageView(image: UIImage(named: "vicktoryBackground"))
    
    public let nextLevelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "nextLevelButton"), for: .normal)
        return button
    }()
    
    public let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menuButton"), for: .normal)
        return button
    }()
    
    private let apple = UIImageView(image: UIImage(named: "scoresApple"))
    public let score: UILabel = {
        let label = UILabel()
        label.text = "\(AppDelegate.shared.countScores)"
        label.textAlignment = .center
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        label.textColor = .white
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
        addSubview(menuButton)
        addSubview(nextLevelButton)
        addSubview(apple)
        addSubview(score)
    }
    
    private func setupConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
        
        nextLevelButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(193/852*UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
        }
        menuButton.snp.makeConstraints { make in
            make.top.equalTo(nextLevelButton.snp.bottom)
            make.centerX.equalToSuperview()
        }
        apple.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120/852*UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(69/852*UIScreen.main.bounds.height)
        }
        
        score.snp.makeConstraints { make in
            make.bottom.equalTo(apple.snp.bottom).inset(18/852*UIScreen.main.bounds.height)
            make.width.equalTo(50/393*UIScreen.main.bounds.width)
            make.leading.equalTo(apple.snp.leading).offset(5)
            //make.centerX.equalToSuperview()
        }
        
    }
}
