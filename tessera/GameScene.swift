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

    func nextFrameAction() -> SKAction {
        return SKAction.run {
            if self.board!.update() { self.stopGame() }
        }
    }

    func startGame() {
        let boardNode = childNode(withName: "board-node")
//        let scorePanelNode = childNode(withName: "score-panel-node")
        board = Board(node: boardNode!)
        slowFall()
    }

    func fastFall() {
        let waitAction: SKAction = SKAction.wait(forDuration: 0.05)
        let gameLoopActions: SKAction = SKAction.repeatForever(SKAction.sequence([nextFrameAction(), waitAction]))
        self.removeAllActions()
        self.run(gameLoopActions)
    }

    func slowFall() {
        let waitAction: SKAction = SKAction.wait(forDuration: 0.25)
        let gameLoopActions: SKAction = SKAction.repeatForever(SKAction.sequence([nextFrameAction(), waitAction]))
        self.removeAllActions()
        self.run(gameLoopActions)
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
            if (board!.moveRight()) { self.stopGame() }
            break;
        case 0x0: // As
            if (board!.moveLeft()) { self.stopGame() }
            break;
        case 0x1: // S
            fastFall()
            break;
        default:
//            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
            break;
        }
    }

    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 0x01: // S
            slowFall()
            break;
        default:
            break;
        }
    }
}
