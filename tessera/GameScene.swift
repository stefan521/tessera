//
//  GameScene.swift
//  tessera
//
//  Created by Stefan on 17/03/2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let square = Square()

    override func didMove(to view: SKView) {

        //private var board: SKSpriteNode?
        //        self.board = self.childNode(withName: "//board") as? SKSpriteNode
        //        if let brd = self.board {
        //            self.board?.physicsBody = SKPhysicsBody.init(edgeLoopFrom: brd.frame)
        //        }

        physicsWorld.gravity = CGVector(dx: 0, dy: -0.10)
        physicsBody = SKPhysicsBody.init(edgeLoopFrom: frame)
        square.initialisePiece()
        addChild(square)
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x2:
            square.moveRight()
            print(square.position)
        case 0x0:
            square.moveLeft()
            print(square.position)
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
}
