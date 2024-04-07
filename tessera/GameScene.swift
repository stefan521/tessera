//
//  GameScene.swift
//  tessera
//
//  Created by Stefan on 17/03/2024.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene, SKPhysicsContactDelegate {

    var currentPiece: Square?

    // Make the matrix here to store the board state
    // Pieces should be made of individual suqares so it is easier to remove them later.
    
    func isGameOver() -> Bool {
        if let piece = currentPiece {
            return piece.isAtTheTop(topY: frame.maxY)
        } else {
            return false
        }
    }
    
    public func stopGame() {
        let shadeNode = SKSpriteNode(color: NSColor.black.withAlphaComponent(0.5), size: frame.size)
        let gameOverLabel = SKLabelNode(text: "ΓΑΜΕ OβΕΡ")
        gameOverLabel.fontName = "AvenirNext-Bold"
        gameOverLabel.fontSize = 80
        addChild(shadeNode)
        addChild(gameOverLabel)
    }
    
    public func printHello() -> () {
        print("Helloooo")
    }

    func startGame() {
        let makeNextFrameAction: SKAction = SKAction.run { self.printHello() }
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
    
    /*
     check if the piece touched the ground or something solid.
     - if yes then evaluate logic to delete row, game over, then make new piece
     - if no then move piece down
     */
    func nextFrame() {
        
    }

    func nextPiece() {
        currentPiece?.stopPiece()
        
        if (isGameOver()) {
            stopGame()
        } else {
            let piece: Square = Square()
            piece.initialisePiece(topY: frame.maxY)
            currentPiece = piece
            addChild(piece)
        }
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
            currentPiece?.moveRight()
        case 0x0: // A
            currentPiece?.moveLeft()
        case 0x1: // S
//            currentPiece?.physicsBody?.velocity = Velocity.Fast
            break;
        default:
//            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
            break;
        }
    }

    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 0x01: // S
//            currentPiece?.physicsBody?.velocity = Velocity.Slow
            break;
        default:
            break;
        }
    }
}
