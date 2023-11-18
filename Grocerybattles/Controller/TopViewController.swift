//
//  TopViewController.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import UIKit

final class TopViewController: UIViewController {

    private let topView = TopView()
    private let usersArray = Source.getUsersArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        setupView()
        addTargets()
        setupTableView()
    }
    
    private func setupView() {
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func addTargets() {
        topView.backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
    }
    
    private func setupTableView() {
        topView.usersTableView.dataSource = self
        topView.usersTableView.delegate = self
        topView.usersTableView.register(TopTableViewCell.self, forCellReuseIdentifier: TopTableViewCell.reuseId)
    }
}

extension TopViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopTableViewCell.reuseId) as? TopTableViewCell else {
            fatalError()
        }
        cell.configure(name: usersArray[indexPath.row].name,
                       levels: usersArray[indexPath.row].level,
                       points: usersArray[indexPath.row].points)
        return cell
    }
}

private extension TopViewController {
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
}
