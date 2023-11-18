//
//  CustomSlider.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 26.08.2023.
//

import UIKit

final class CustomSlider: UISlider {

    override init(frame: CGRect) {
        super.init(frame: frame)
        settings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func settings() {
        //background
        let backgroundImage = UIImage(named: "slider")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
        
        //thumb
        setThumbImage(UIImage(named: "thumb"), for: .normal)
        
        
        //trackColor
        maximumTrackTintColor = .clear
        minimumTrackTintColor = .clear
        
        //value
        
        minimumValue = 0
        maximumValue = 1
    }
}
