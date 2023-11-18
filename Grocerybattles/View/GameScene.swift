//
//  GameScene.swift
//  TestApp
//
//  Created by Александр Андреев on 28.08.2023.
//

import Foundation
import SpriteKit

final class GameScene: SKScene {
    private var currentNode: SKNode?
    let numOfProducts = 5
    // Количество продуктов для сбора
    
    let cellsLayer = SKNode()
    var gameRectangle = SKSpriteNode()
    var cellWidth =  CGFloat()
    var cellHeight =  CGFloat()
    
    var currentNodeName : String!
    var currentObjectArray = [SKNode]()
    
    
    override func didMove(to view: SKView) {
        print(AppDelegate.shared.numberOfMoves)
        print(AppDelegate.shared.countNeed)
        configure()
    }
    
    private func configure() {
        setupBackground()
        createGameField()
        createGameCells()
    }
    
    private func setupCell(position: CGPoint) {
        let cellSize = CGSize(width: cellWidth, height: cellHeight)
        let cellNode = SKSpriteNode()
        cellNode.position = position
        cellNode.size = cellSize
        
        let name = nameArray.randomElement()
        cellNode.name = name
        
        let texture = SKTexture(imageNamed: name!)
        let tex = SKSpriteNode(texture: texture)
        tex.size = CGSize(width: texture.size().width/852*UIScreen.main.bounds.height, height: texture.size().height/852*UIScreen.main.bounds.height)
        tex.zPosition = 10
        
        cellNode.addChild(tex)
        cellsLayer.addChild(cellNode)
    }
    
    private func loseScene() {
        let vc = LoseGameViewController()
        if let navigationController = self.view?.window?.rootViewController as? UINavigationController {
            navigationController.navigationBar.isHidden = true
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
    public func winScene() {
        for object in self.checkGameObjects() {
            object.removeFromParent()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            AppDelegate.shared.countScores += 25
            AppDelegate.shared.currentLvl += 1
            let vc = VictoryViewController()
            if let navigationController = self.view?.window?.rootViewController as? UINavigationController {
                navigationController.navigationBar.isHidden = true
                navigationController.pushViewController(vc, animated: true)
            }
        }
    }
    
    private func createGameField() {
        addChild(cellsLayer)
        gameRectangle = SKSpriteNode(imageNamed: "rectangle")
        gameRectangle.zPosition = 1
        gameRectangle.size.height = (self.scene?.frame.height)! / 2.3
        gameRectangle.size.width = gameRectangle.size.height
        addChild(gameRectangle)
        
        cellWidth = gameRectangle.size.width*0.95 / 7
        cellHeight = gameRectangle.size.height*0.8 / 5
        
        let layerPosition = CGPoint(x: gameRectangle.frame.minX+32/393*UIScreen.main.bounds.width, y: gameRectangle.frame.minY+65/852*UIScreen.main.bounds.height)
        cellsLayer.position = layerPosition
    }
    
    private func createGameCells(){
        for row in 0..<5 {
            for col in 0..<7 {
                let cellPos = CGPoint(x: CGFloat(col) * cellWidth, y: CGFloat(row) * cellHeight)
                setupCell(position: cellPos)
            }
        }
    }
    
    private func setupBackground(){
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let background = SKSpriteNode(imageNamed: "back")
        background.size = size
        background.zPosition = -1
        addChild(background)
    }
    
    private func checkGameObjects()->[SKNode]{
        var array = [SKNode]()
        for object in cellsLayer.children{
            for name in nameArray{
                if object.name == name {
                    array.append(object)
                }
            }
        }
        return array
    }

    private func addLine(position: CGPoint, orientation: String) {
        let lineNode = SKSpriteNode(imageNamed: orientation)
        lineNode.name = "line"
        if orientation == "vertical" {
            lineNode.size.width = cellWidth / 2
            lineNode.size.height = cellHeight
        } else {
            lineNode.size.width = cellWidth
            lineNode.size.height = cellHeight / 2
        }
        lineNode.position = position
        lineNode.zPosition = 9
        cellsLayer.addChild(lineNode)
        currentObjectArray.append(lineNode)
    }
}

extension GameScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        AppDelegate.shared.numberOfMoves -= 1
        currentObjectArray = []
        NotificationCenter.default.post(name: Notification.Name("NumberOfMovesChanged"), object: nil)
        if let touch = touches.first{
            let location = touch.location(in: self)
            let touchNodes = self.nodes(at: location)
            for node in touchNodes.reversed(){
                for name in nameArray{
                    if node.name == name {
                        self.currentNode = node
                        currentObjectArray.append(self.currentNode!)
                    }
                }
            }
        }
    }
    
    
    //MARK: Game Logic
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let touchLocation = touch.location(in: cellsLayer)
         
            for object in checkGameObjects() {
                
                if object.contains(touchLocation) && object.name == currentObjectArray.last?.name {
                    
                    if currentObjectArray.last?.position.x == object.position.x && currentObjectArray.last?.position.y != object.position.y {
                        
                        if  (currentObjectArray.last?.position.y)! - touchLocation.y  <= cellHeight + 10 &&  touchLocation.y - (currentObjectArray.last?.position.y)! <= cellHeight + 10 {
                            
                            if (currentObjectArray.last?.position.y)! > touchLocation.y {
                                
                                let pos = CGPoint(x: (currentObjectArray.last?.position.x)!, y: (currentObjectArray.last?.position.y)! - cellHeight/2)
                                addLine(position: pos, orientation: "vertical")
                            } else if (currentObjectArray.last?.position.y)! < touchLocation.y{
                                
                                let pos = CGPoint(x: (currentObjectArray.last?.position.x)!, y: (currentObjectArray.last?.position.y)! + cellHeight/2)
                                addLine(position: pos, orientation: "vertical")
                                
                            }
                            currentObjectArray.append(object)
                        }
                    } else if currentObjectArray.last?.position.x != object.position.x && currentObjectArray.last?.position.y == object.position.y{
                        if  (currentObjectArray.last?.position.x)! - touchLocation.x  <= cellWidth + 10 &&  touchLocation.x - (currentObjectArray.last?.position.x)! <= cellWidth + 10 {
                            
                            if (currentObjectArray.last?.position.x)! > touchLocation.x{
                                
                                let pos =  CGPoint(x: (currentObjectArray.last?.position.x)! - cellWidth/2, y: (currentObjectArray.last?.position.y)!-10)
                                addLine(position: pos, orientation: "horizontal")
                                
                            } else if (currentObjectArray.last?.position.x)! < touchLocation.x{
                                
                                let pos = CGPoint(x: (currentObjectArray.last?.position.x)! + cellWidth/2, y: (currentObjectArray.last?.position.y)!-10)
                                addLine(position: pos, orientation: "horizontal")
                                
                            }
                            currentObjectArray.append(object)
                        }
                    }
                }
            }
        }

        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if currentObjectArray.count > 1{
            for object in currentObjectArray {
                let pos = object.position
                object.removeFromParent()
                if object.name != "line"  {
                    setupCell(position: pos)
                }
            }
            if currentObjectArray.last!.name! == AppDelegate.shared.typeFruit {
                AppDelegate.shared.countNeed -= Int((currentObjectArray.count) / 2) + 1
                NotificationCenter.default.post(name: Notification.Name("ProdChanged"), object: nil)
            }
        }
        if AppDelegate.shared.countNeed <= 0 {
            winScene()
        } else if AppDelegate.shared.numberOfMoves == 0 {
            loseScene()
        }
        
        print("prod")
        print(AppDelegate.shared.countNeed)
        print("moves")
        print(AppDelegate.shared.numberOfMoves)
        
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if currentObjectArray.count > 1{
            for object in currentObjectArray {
                object.removeFromParent()
            }
        }
    }
}
