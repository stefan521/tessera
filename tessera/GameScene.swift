//
//  GameScene.swift
//  tessera
//
//  Created by Stefan on 17/03/2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    let square = SKSpriteNode(color: NSColor.systemPink, size: CGSize.init(width: 40, height: 40))
    

    override func didMove(to view: SKView) {
        
        //private var board: SKSpriteNode?
        //        self.board = self.childNode(withName: "//board") as? SKSpriteNode
        //        if let brd = self.board {
        //            self.board?.physicsBody = SKPhysicsBody.init(edgeLoopFrom: brd.frame)
        //        }
    

        let pb = SKPhysicsBody.init(rectangleOf: CGSize.init(width: 40, height: 40))
        pb.restitution = 0
        pb.allowsRotation = false
        square.physicsBody = pb;
        square.position = CGPoint(x: 0, y: frame.maxY - 40)
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -0.10)
        physicsBody = SKPhysicsBody.init(edgeLoopFrom: frame)

        addChild(square)
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x2:
            if (square.position.x <= 80) {
                square.position = CGPoint(x: square.position.x + 40, y: square.position.y)
            }
            print(square.position)
        case 0x0:
            if (square.position.x >= -279) {
                square.position = CGPoint(x: square.position.x - 40, y: square.position.y)
            }
            print(square.position)
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
}
