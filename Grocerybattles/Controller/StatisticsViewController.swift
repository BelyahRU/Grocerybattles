//
//  StatisticsViewController.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import UIKit

final class StatisticsViewController: UIViewController {
    
    private let statisticsView = StatisticsView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        setupView()
        addTargets()
    }
    
    private func setupView() {
        view.addSubview(statisticsView)
        statisticsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func addTargets() {
        statisticsView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
}

private extension StatisticsViewController {
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}
