//
//  TopView.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import UIKit

final class TopView: UIView {

    private let background = UIImageView(image: UIImage(named: "topBackground"))
    private let levels = UIImageView(image: UIImage(named: "Levels"))
    private let points = UIImageView(image: UIImage(named: "Points"))
    private let youApple = UIImageView(image: UIImage(named: "youApple"))
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    public let userLevels: UILabel = {
        let label = UILabel()
        label.text = "\(AppDelegate.shared.currentLvl)"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Coiny-Regular", size: 15)
        return label
    }()
    
    public let userPoints: UILabel = {
        let label = UILabel()
        label.text = "\(AppDelegate.shared.countScores)"
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Coiny-Regular", size: 15)
        return label
    }()
    
    public let usersTableView: UITableView = {
        let tabV = UITableView()
        tabV.backgroundColor = .clear
        tabV.rowHeight = 50/852*UIScreen.main.bounds.height
        tabV.isScrollEnabled = false
        tabV.allowsSelection = false
        return tabV
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
        addSubview(levels)
        addSubview(points)
        addSubview(youApple)
        addSubview(userLevels)
        addSubview(userPoints)
        addSubview(usersTableView)
    }
    
    private func setupConstraints() {
        //852*393
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        levels.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(123/852*UIScreen.main.bounds.height)
            make.leading.equalToSuperview().offset(155/393*UIScreen.main.bounds.width)
        }
        
        points.snp.makeConstraints { make in
            make.top.equalTo(levels.snp.top)
            make.leading.equalTo(levels.snp.trailing).offset(8)
        }
        
        youApple.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(43/393*UIScreen.main.bounds.width)
            make.top.equalTo(levels.snp.bottom)
        }
        
        userLevels.snp.makeConstraints { make in
            make.centerY.equalTo(youApple.snp.centerY)
            make.leading.equalTo(youApple.snp.trailing).offset(79/393*UIScreen.main.bounds.width)
            make.width.equalTo(81)
            make.height.equalTo(17)
        }

        userPoints.snp.makeConstraints { make in
            make.centerY.equalTo(youApple.snp.centerY)
            make.leading.equalTo(userLevels.snp.trailing).offset(8/393*UIScreen.main.bounds.width)
        }
        
        usersTableView.snp.makeConstraints { make in
            make.top.equalTo(youApple.snp.bottom).offset(21)
            make.leading.equalToSuperview().offset(20/393*UIScreen.main.bounds.width)
            make.width.equalTo(347/393*UIScreen.main.bounds.width)
            make.bottom.equalToSuperview().inset(270/852*UIScreen.main.bounds.height)
        }
    }
    

}
