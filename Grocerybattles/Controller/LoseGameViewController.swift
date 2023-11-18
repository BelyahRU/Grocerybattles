//
//  LoseGameViewController.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 29.08.2023.
//

import UIKit

final class LoseGameViewController: UIViewController {

    private let loseGame = LoseGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupView()
        addTargets()
    }
    
    private func setupView() {
        view.addSubview(loseGame)
        loseGame.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func addTargets() {
        loseGame.menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        loseGame.tryAgainButton.addTarget(self, action: #selector(tryAgainButtonPressed), for: .touchUpInside)
        loseGame.upgradesButton.addTarget(self, action: #selector(upgradesButtonPressed), for: .touchUpInside)
    }

}

extension LoseGameViewController {
    @objc func menuPressed() {
        let vc = MainViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func tryAgainButtonPressed() {
        let vc = GameViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func upgradesButtonPressed() {
        let vc = ShopViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
