//
//  MainViewController.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import Foundation
import UIKit
import SnapKit
import AVFAudio

final class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    static var backgroundMusic: AVAudioPlayer? = {
      guard let url = Bundle.main.url(forResource: "Mining by Moonlight", withExtension: "mp3") else {
        return nil
      }
      
      do {
        let player = try AVAudioPlayer(contentsOf: url)
        player.numberOfLoops = -1
        
        return player
      } catch {
        return nil
      }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func setupBackgroundAudio() {
//        MainViewController.backgroundMusic?.volume = 0.5
        MainViewController.backgroundMusic?.volume = 0
        MainViewController.backgroundMusic?.play()
    }
    
    private func configure() {
        setupBackgroundAudio()
        setupView()
        addTargets()
    }
    
    private func setupView() {
        view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func addTargets() {
        mainView.playButton.addTarget(self, action: #selector(playPressed), for: .touchUpInside)
        mainView.settingsButton.addTarget(self, action: #selector(settingsPressed), for: .touchUpInside)
        mainView.shopButton.addTarget(self, action: #selector(shopPressed), for: .touchUpInside)
        mainView.statisticsButton.addTarget(self, action: #selector(statisticsPressed), for: .touchUpInside)
        mainView.topButton.addTarget(self, action: #selector(topPressed), for: .touchUpInside)
    }
}
extension MainViewController {
    @objc func playPressed() {
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func settingsPressed() {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func shopPressed() {
        let vc = ShopViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func statisticsPressed() {
        let vc = StatisticsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func topPressed() {
        let vc = TopViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
