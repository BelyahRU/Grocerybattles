//
//  VictoryViewController.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 29.08.2023.
//

import UIKit

final class VictoryViewController: UIViewController {
    
    private let victoryView = VictoryView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupView()
        addTargets()
    }
    
    private func setupView() {
        view.addSubview(victoryView)
        victoryView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func addTargets() {
        victoryView.menuButton.addTarget(self, action: #selector(menuPressed), for: .touchUpInside)
        victoryView.nextLevelButton.addTarget(self, action: #selector(nextLevelPressed), for: .touchUpInside)
    }

}

extension VictoryViewController {
    @objc func menuPressed() {
        let vc = MainViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func nextLevelPressed() {
        let vc = GameViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
