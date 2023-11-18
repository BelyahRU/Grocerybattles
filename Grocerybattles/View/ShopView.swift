//
//  ShopView.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import UIKit

final class ShopView: UIView {

    private let background = UIImageView(image: UIImage(named: "shopBackground"))
    
    private let oneHungredApples = UIImageView(image: UIImage(named: "100apples"))
    
    private let twentyFiveApples = UIImageView(image: UIImage(named: "25apples"))
    
    private let videoApple = UIImageView(image: UIImage(named: "videoapple"))
    
    private let addFiveLabel: UILabel = {
        let label = UILabel()
        label.text = "booster in the form of an extra 5 moves"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        return label
    }()
    
    private let binLabel: UILabel = {
        let label = UILabel()
        label.text = "booster removes all products on the field - considering the needed ones at this level as collected ones"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        return label
    }()
    
    public let binButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "binButton"), for: .normal)
        return button
    }()
    
    public let add5Button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "5+Button"), for: .normal)
        return button
    }()
    
    public let chechVideoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "videoButton"), for: .normal)
        return button
    }()
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
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
        
        addSubview(add5Button)
        addSubview(binButton)
        addSubview(chechVideoButton)
        
        addSubview(oneHungredApples)
        addSubview(twentyFiveApples)
        addSubview(videoApple)
        
        addSubview(addFiveLabel)
        addSubview(binLabel)
    }
    
    private func setupConstraints() {
        //852*393
        //852*UIScreen.main.bounds.height
        //393*UIScreen.main.bounds.width
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        add5Button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(130/852*UIScreen.main.bounds.height)
            make.width.height.equalTo(138/852*UIScreen.main.bounds.height)
        }
        
        addFiveLabel.snp.makeConstraints { make in
            make.top.equalTo(add5Button.snp.bottom).offset(10)
            make.width.equalTo(267)
            make.centerX.equalToSuperview()
        }
        
        binButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(340/852*UIScreen.main.bounds.height)
            make.width.height.equalTo(138/852*UIScreen.main.bounds.height)
        }
        
        binLabel.snp.makeConstraints { make in
            make.top.equalTo(binButton.snp.bottom).offset(10)
            make.width.equalTo(267)
            make.centerX.equalToSuperview()
        }
        
        chechVideoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(620/852*UIScreen.main.bounds.height)
            make.width.height.equalTo(138/852*UIScreen.main.bounds.height)
        }
        
        oneHungredApples.snp.makeConstraints { make in
            make.leading.equalTo(add5Button.snp.trailing).offset(25)
            make.centerY.equalTo(add5Button.snp.centerY)
        }
        
        twentyFiveApples.snp.makeConstraints { make in
            make.leading.equalTo(binButton.snp.trailing).offset(25)
            make.centerY.equalTo(binButton.snp.centerY)
        }
        
        videoApple.snp.makeConstraints { make in
            make.leading.equalTo(chechVideoButton.snp.trailing).offset(25)
            make.centerY.equalTo(chechVideoButton.snp.centerY)
        }
        
        
        
    }
    

}
