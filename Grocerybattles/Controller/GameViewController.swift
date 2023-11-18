//
//  GameViewController.swift
//  Grocerybattles
//
//  Created by Александр Андреев on 25.08.2023.
//

import UIKit
import SpriteKit

final class GameViewController: UIViewController {
    
    private var scene: GameScene!
    
    //    private let gameView = GameView()
    
    private let lvlImage = UIImageView(image: UIImage(named: "lvlGroup"))
    private let countFruitsIm = UIImageView(image: UIImage(named: "lvlGroup"))
    private let kindFruit: UIImageView = {
        AppDelegate.shared.typeFruit = nameArray.randomElement()!
//        AppDelegate.shared.typeFruit = "Chocolate"
        let im = UIImageView(image: UIImage(named: AppDelegate.shared.typeFruit))
        return im
    }()
    public let countNeed: UILabel = {
        let label = UILabel()
        AppDelegate.shared.countNeed = Int.random(in: 4...8)
//        AppDelegate.shared.countNeed = 5
        label.text = "\(AppDelegate.shared.countNeed)"
        label.textAlignment = .center
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        label.textColor = .white
        return label
    }()
    
    private let apple = UIImageView(image: UIImage(named: "scoresApple"))
    
    private let binbinImage = UIImageView(image: UIImage(named: "bin"))
    
    private let add5binImage = UIImageView(image: UIImage(named: "bin"))
    
    
    //MARK: Labels
    
    public let currentLvl: UILabel = {
        let label = UILabel()
        label.text = "lv \(AppDelegate.shared.currentLvl)"
        label.textAlignment = .center
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        label.textColor = .white
        return label
    }()
    
    public let score: UILabel = {
        let label = UILabel()
        AppDelegate.shared.numberOfMoves = Int.random(in: 4...6) // Количество доступных ходов
        label.text = "\(AppDelegate.shared.numberOfMoves)"
        label.textAlignment = .center
        label.font = UIFont(name: "Coiny-Regular", size: 20)
        label.textColor = .white
        return label
    }()
    
    //MARK: Buttons
    public let add5Donate: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "5+Button"), for: .normal)
        button.isHidden = AppDelegate.shared.fiveplusisHidden
        return button
    }()
    
    public let binDonate: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "binButton"), for: .normal)
        button.isHidden = AppDelegate.shared.binIsHidden
        return button
    }()
    
    public let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //AppDelegate.shared.numberOfMoves = Int.random(in: 4...6) // Количество доступных ходов
        NotificationCenter.default.addObserver(self, selector: #selector(updateMovesLabel), name: Notification.Name("NumberOfMovesChanged"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updeteProd), name: Notification.Name("ProdChanged"), object: nil)

        setupScene()
        configure()
        
    }
    
    @objc func updateMovesLabel() {
        score.text = "\(AppDelegate.shared.numberOfMoves)"
    }
    
    @objc func updeteProd() {
        countNeed.text = "\(AppDelegate.shared.countNeed)"
    }

    
    private func setupScene() {
        view = SKView(frame: view.bounds)
        let skView = view as! SKView
        skView.showsNodeCount = false
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
    
}


extension GameViewController {
    
    
    private func configure() {
        setupSubviews()
        setupConstraints()
        addTargets()
    }
    
    private func setupSubviews() {
        
        view.addSubview(countFruitsIm)
        view.addSubview(kindFruit)
        view.addSubview(countNeed)
        
        view.addSubview(backButton)
        
        
        view.addSubview(lvlImage)
        view.addSubview(apple)
        view.addSubview(binbinImage)
        view.addSubview(add5binImage)
        
        
        
        view.addSubview(currentLvl)
        view.addSubview(score)
        
        view.addSubview(add5Donate)
        view.addSubview(binDonate)
    }
    
    private func setupConstraints() {
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        lvlImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalTo(80.9/393*UIScreen.main.bounds.width)
            make.height.equalTo(64.9/852*UIScreen.main.bounds.height)
        }
        
        apple.snp.makeConstraints { make in
            make.top.equalTo(lvlImage.snp.bottom).offset(20/852*UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(69/852*UIScreen.main.bounds.height)
        }
        
        
        add5binImage.snp.makeConstraints { make in
            make.bottom.equalTo(binbinImage.snp.top).inset(5)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(104/393*UIScreen.main.bounds.width)
            make.height.equalTo(96/852*UIScreen.main.bounds.height)
        }
        
        binbinImage.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(31/852*UIScreen.main.bounds.height)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(104/393*UIScreen.main.bounds.width)
            make.height.equalTo(96/852*UIScreen.main.bounds.height)
        }
        
        
        
        currentLvl.snp.makeConstraints { make in
            make.bottom.equalTo(lvlImage.snp.bottom).inset(12/852*UIScreen.main.bounds.height)
            make.centerX.equalToSuperview()
        }
        
        score.snp.makeConstraints { make in
            make.bottom.equalTo(apple.snp.bottom).inset(18/852*UIScreen.main.bounds.height)
            make.width.equalTo(50/393*UIScreen.main.bounds.width)
            make.leading.equalTo(apple.snp.leading).offset(5)
        }
        
        add5Donate.snp.makeConstraints { make in
            make.width.height.equalTo(59/393*UIScreen.main.bounds.width)
            make.top.equalTo(add5binImage.snp.top)
            make.leading.equalTo(binbinImage.snp.leading).offset(18/393*UIScreen.main.bounds.width)
        }
        
        binDonate.snp.makeConstraints { make in
            make.width.height.equalTo(59/393*UIScreen.main.bounds.width)
            make.top.equalTo(binbinImage.snp.top)
            make.leading.equalTo(binbinImage.snp.leading).offset(18/393*UIScreen.main.bounds.width)
        }
        
        countFruitsIm.snp.makeConstraints { make in
            make.top.equalTo(apple.snp.top)
            make.leading.equalToSuperview().offset(41)
            make.width.equalTo(59)
            make.height.equalTo(47)
        }
        
        kindFruit.snp.makeConstraints { make in
            make.leading.equalTo(countFruitsIm.snp.leading).offset(7)
            make.bottom.equalTo(countFruitsIm.snp.bottom).inset(5)
            make.width.equalTo(kindFruit.bounds.width/1.8)
            make.height.equalTo(kindFruit.bounds.height/1.8)
            
        }
        
        countNeed.snp.makeConstraints { make in
            make.trailing.equalTo(countFruitsIm.snp.trailing).offset(-7)
            make.bottom.equalTo(countFruitsIm.snp.bottom).inset(3)
        }
    }
    
    func addTargets() {
        backButton.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        add5Donate.addTarget(self, action: #selector(add5DonatePressed), for: .touchUpInside)
        binDonate.addTarget(self, action: #selector(binDonatePressed), for: .touchUpInside)
    }
        
}

extension GameViewController {
    @objc func backPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func add5DonatePressed() {
        add5Donate.isHidden = true
        AppDelegate.shared.fiveplusisHidden = true
        AppDelegate.shared.numberOfMoves += 5
    }
    
    
    @objc func binDonatePressed() {
        scene.winScene()
    }
}
    
