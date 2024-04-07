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
    
    func isGameOver() -> Bool {
        if let piece = currentPiece {
            return piece.isAtTheTop(topY: frame.maxY)
        } else {
            return false
        }
    }
    
    func stopGame() {
        let shadeNode = SKSpriteNode(color: NSColor.black.withAlphaComponent(0.5), size: frame.size)
        let gameOverLabel = SKLabelNode(text: "ΓΑΜΕ OβΕΡ")
        gameOverLabel.fontName = "AvenirNext-Bold"
        gameOverLabel.fontSize = 80
        addChild(shadeNode)
        addChild(gameOverLabel)
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

        //private var board: SKSpriteNode?
        //        self.board = self.childNode(withName: "//board") as? SKSpriteNode
        //        if let brd = self.board {
        //            self.board?.physicsBody = SKPhysicsBody.init(edgeLoopFrom: brd.frame)
        //        }
        let startPoint = CGPoint(x: frame.minX, y: frame.minY)
        let endPoint = CGPoint(x: frame.maxX, y: frame.minY)
        let pb = SKPhysicsBody(edgeFrom: startPoint, to: endPoint)

        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        pb.restitution = 0.0
        pb.categoryBitMask = BitMask.Static
        pb.contactTestBitMask = BitMask.All
        physicsBody = pb
        physicsWorld.contactDelegate = self

        nextPiece()
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
            currentPiece?.physicsBody?.velocity = Velocity.Fast
        default:
//            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
            break;
        }
    }

    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 0x01: // S
            currentPiece?.physicsBody?.velocity = Velocity.Slow
        default:
            break;
        }
    }

    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch contactMask {
        case BitMask.FallingPiece | BitMask.Static:
            nextPiece()
        default:
            break
        }
    }
}
