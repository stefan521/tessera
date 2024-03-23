//
//  Square.swift
//  tessera
//
//  Created by Stefan on 19/03/2024.
//

import SpriteKit

class Square: SKSpriteNode {
    private let width: Int = TILE_SIZE * 2
    private let height: Int = TILE_SIZE * 2
    private var xPosition: Int = -120

    func initialisePiece(topY: CGFloat) {
        self.color = NSColor.orange
        self.size = CGSize(width: width, height: height)
        setPhyisics()
        setPositionTopOfScreen(topY: topY)
    }
    
    func stopPiece() {
        self.physicsBody?.categoryBitMask = BitMask.Static
        self.physicsBody?.isDynamic = false
    }
    
    func isAtTheTop(topY: CGFloat) -> Bool {
        return self.position.y >= topY - CGFloat(Float(height))
    }

    func moveLeft() {
        if (self.position.x > MIN_X + CGFloat(width)) {
            let newXPosition = xPosition - width
            self.xPosition = newXPosition
            self.position = CGPoint(x: CGFloat(Float(newXPosition)), y: self.position.y)
        }
    }

    func moveRight() {
        if (self.position.x < MAX_X - CGFloat(width)) {
            let newXPosition = xPosition + width
            self.xPosition = newXPosition
            self.position = CGPoint(x: CGFloat(Float(newXPosition)), y: self.position.y)
        }
    }

    private func setPositionTopOfScreen(topY: CGFloat) {
        self.position = CGPoint(x: CGFloat(Float(xPosition)), y: topY - CGFloat(Float(height)))
    }

    private func setPhyisics() {
        //  90% of width so it doesn't touch other pieces laterally
        let size = CGSizeMake(self.frame.width * 0.9, self.frame.height)
        let squarePshysicsBody = SKPhysicsBody.init(rectangleOf: size)
        squarePshysicsBody.restitution = 0.0
        squarePshysicsBody.allowsRotation = false
        squarePshysicsBody.categoryBitMask = BitMask.FallingPiece
        squarePshysicsBody.contactTestBitMask = BitMask.All
        squarePshysicsBody.velocity = Velocity.Slow
        squarePshysicsBody.usesPreciseCollisionDetection = true
        self.physicsBody = squarePshysicsBody;
    }
}
