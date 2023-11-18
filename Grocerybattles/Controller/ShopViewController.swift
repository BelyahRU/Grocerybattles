//
//  ShopViewController.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import UIKit

final class ShopViewController: UIViewController {

    private let shopView = ShopView()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        setupView()
        addTargets()
    }
    
    private func setupView() {
        view.addSubview(shopView)
        shopView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func addTargets() {
        shopView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        shopView.add5Button.addTarget(self, action: #selector(addFivePressed), for: .touchUpInside)
        shopView.binButton.addTarget(self, action: #selector(binPressed), for: .touchUpInside)
    }
}

private extension ShopViewController {
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addFivePressed() {
        if AppDelegate.shared.countScores - 100 < 0 {
            let alert = UIAlertController(title: "ERROR", message: "Insufficient funds", preferredStyle: .alert)
            if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                viewController.present(alert, animated: true, completion: nil)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "PURCHASE", message: "", preferredStyle: .alert)
            if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                viewController.present(alert, animated: true, completion: nil)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                alert.dismiss(animated: true, completion: nil)
            }
            AppDelegate.shared.countScores -= 100
            AppDelegate.shared.countBusters += 1
            AppDelegate.shared.fiveplusisHidden = false
        }
    }
    
    @objc func binPressed() {
        if AppDelegate.shared.countScores - 25 < 0 {
            let alert = UIAlertController(title: "ERROR", message: "Insufficient funds", preferredStyle: .alert)
            if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                viewController.present(alert, animated: true, completion: nil)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                alert.dismiss(animated: true, completion: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "PURCHASE", message: "", preferredStyle: .alert)
            if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                viewController.present(alert, animated: true, completion: nil)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                alert.dismiss(animated: true, completion: nil)
            }
            AppDelegate.shared.countBusters += 1
            AppDelegate.shared.countScores -= 25
            AppDelegate.shared.binIsHidden = false
        }
    }
}
