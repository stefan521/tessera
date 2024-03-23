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
    
    func nextPiece() {
        let piece: Square = Square()
        piece.initialisePiece(topY: frame.maxY)
        currentPiece?.physicsBody?.categoryBitMask = BitMask.Static
        currentPiece?.physicsBody?.affectedByGravity = false
        currentPiece = piece
        addChild(piece)
    }

    override func didMove(to view: SKView) {

        //private var board: SKSpriteNode?
        //        self.board = self.childNode(withName: "//board") as? SKSpriteNode
        //        if let brd = self.board {
        //            self.board?.physicsBody = SKPhysicsBody.init(edgeLoopFrom: brd.frame)
        //        }

        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        let pb = SKPhysicsBody.init(edgeLoopFrom: frame)
        pb.restitution = 0.0
        pb.categoryBitMask = BitMask.Static
        pb.contactTestBitMask = BitMask.All
        physicsBody = pb
        physicsWorld.contactDelegate = self

        nextPiece()
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x2: // D
            currentPiece?.moveRight()
        case 0x0: // A
            currentPiece?.moveLeft()
        case 0x1:
            currentPiece?.physicsBody?.velocity = CGVectorMake(0, -400)
        default:
//            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
            break;
        }
    }

    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 0x01: // S
            currentPiece?.physicsBody?.velocity = CGVectorMake(0, -100)
        default:
            break;
        }
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch contactMask {
        case BitMask.FallingPiece | BitMask.Static:
//            print(currentPiece?.frame)
//            let newPb = SKPhysicsBody.init(edgeLoopFrom: currentPiece!.frame)
//            newPb.categoryBitMask = BitMask.Static
//            newPb.restitution = 0.0
//            newPb.contactTestBitMask = BitMask.All
//            currentPiece?.physicsBody = newPb
            nextPiece()
        default:
            break
        }
    }
}
