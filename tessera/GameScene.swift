//
//  GameScene.swift
//  tessera
//
//  Created by Stefan on 17/03/2024.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {

    private var board: Board?

    // Make the matrix here to store the board state
    // Pieces should be made of individual suqares so it is easier to remove them later.
    
    func isGameOver() -> Bool {
        return false
    }
    
    public func stopGame() {
        self.removeAllActions()
        let shadeNode = SKSpriteNode(color: NSColor.black.withAlphaComponent(0.5), size: frame.size)
        let gameOverLabel = SKLabelNode(text: "ΓΑΜΕ OβΕΡ")
        gameOverLabel.fontName = "AvenirNext-Bold"
        gameOverLabel.fontSize = 80
        addChild(shadeNode)
        addChild(gameOverLabel)
    }


    func startGame() {
        let boardNode = childNode(withName: "board-node")
        let scorePanelNode = childNode(withName: "score-panel-node")
        board = Board(node: boardNode!)
        let makeNextFrameAction: SKAction = SKAction.run {
            if (self.board!.update()) {
                self.stopGame()
            }
        }
        let waitAction: SKAction = SKAction.wait(forDuration: 0.25)
        let gameLoopActions: SKAction = SKAction.repeatForever(SKAction.sequence([makeNextFrameAction, waitAction]))
        self.run(gameLoopActions)
    }
    
    // Remove the action from the current node and add a fast one (0.25)
    func speedUp() {
        
    }

    // Remove the wait action form the current node and add a slow one (0.5)
    func slowDown() {
        
    }

    func nextFrame() {
        
    }

    override func didMove(to view: SKView) {
        startGame()
    }

    override func keyDown(with event: NSEvent) {
        if (isGameOver()) {
            return
        }

        switch event.keyCode {
        case 0x2: // D
            board?.moveRight()
            break;
        case 0x0: // A
            board?.moveLeft()
            break;
        case 0x1: // S
            speedUp()
            break;
        default:
//            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
            break;
        }
    }

    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 0x01: // S
            slowDown()
            break;
        default:
            break;
        }
    }
}
