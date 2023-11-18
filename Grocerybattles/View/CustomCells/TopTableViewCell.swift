//
//  TopTableViewCell.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 26.08.2023.
//

import UIKit

final class TopTableViewCell: UITableViewCell {
    
    static let reuseId = "TopTableViewCell"
    
    private let starImage = UIImageView(image: UIImage(named: "star"))
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Coiny-Regular", size: 15)
        return label
    }()
    
    public let levelsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Coiny-Regular", size: 15)
        return label
    }()
    
    public let pointsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: "Coiny-Regular", size: 15)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        backgroundColor = .clear
        
        contentView.addSubview(starImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(levelsLabel)
        contentView.addSubview(pointsLabel)
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalToSuperview()
        }
        
        starImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(7)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(starImage.snp.trailing).offset(8)
        }
        
        levelsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(174)
            make.centerY.equalToSuperview()
        }
        
        pointsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(265)
            make.centerY.equalToSuperview()
        }
    }
    
    public func configure(name: String, levels: String, points: String) {
        nameLabel.text = name
        levelsLabel.text = levels
        pointsLabel.text = points
    }
    
}
