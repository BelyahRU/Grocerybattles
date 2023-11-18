//
//  StatisticsView.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import UIKit

final class StatisticsView: UIView {

    private let background = UIImageView(image: UIImage(named: "statisticsBackground"))
    
    public let countCombo: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        return label
    }()
    
    public let countLevels: UILabel = {
        let label = UILabel()
        label.text = "\(AppDelegate.shared.currentLvl)"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        return label
    }()
    
    public let countPoints: UILabel = {
        let label = UILabel()
        label.text = "\(AppDelegate.shared.countScores)"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        return label
    }()
    
    public let countBooster: UILabel = {
        let label = UILabel()
        label.text = "\(AppDelegate.shared.countBusters)"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        return label
    }()
    
    public let countPointsRepl: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        return label
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
        addSubview(countCombo)
        addSubview(countLevels)
        addSubview(countPoints)
        addSubview(countBooster)
        addSubview(countPointsRepl)
    }
    
    private func setupConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        countCombo.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-62/393*UIScreen.main.bounds.width)
            make.width.equalTo(36.5/393*UIScreen.main.bounds.width)
            make.height.equalTo(29.7/852*UIScreen.main.bounds.height)
            make.top.equalToSuperview().offset(194/852*UIScreen.main.bounds.height)
        }
        
        countLevels.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-62/393*UIScreen.main.bounds.width)
            make.width.equalTo(36.5/393*UIScreen.main.bounds.width)
            make.height.equalTo(29.7/852*UIScreen.main.bounds.height)
            make.top.equalToSuperview().offset(250/852*UIScreen.main.bounds.height)
        }
        
        countPoints.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-40/393*UIScreen.main.bounds.width)
            make.width.equalTo(80/393*UIScreen.main.bounds.width)
            make.height.equalTo(29.7/852*UIScreen.main.bounds.height)
            make.top.equalToSuperview().offset(300/852*UIScreen.main.bounds.height)
        }
        
        countBooster.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-62/393*UIScreen.main.bounds.width)
            make.width.equalTo(36.5/393*UIScreen.main.bounds.width)
            make.height.equalTo(29.7/852*UIScreen.main.bounds.height)
            make.top.equalToSuperview().offset(357/852*UIScreen.main.bounds.height)
        }
        
        countPointsRepl.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-62/393*UIScreen.main.bounds.width)
            make.width.equalTo(36.5/393*UIScreen.main.bounds.width)
            make.height.equalTo(29.7/852*UIScreen.main.bounds.height)
            make.top.equalToSuperview().offset(410/852*UIScreen.main.bounds.height)
        }
        
    }
    

}
