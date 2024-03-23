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
        self.color = NSColor.systemPink
        self.size = CGSize(width: width, height: height)
        setPhyisics()
        setPositionTopOfScreen(topY: topY)
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
        let squarePshysicsBody = SKPhysicsBody.init(rectangleOf: self.frame.size)
        squarePshysicsBody.restitution = 0.0
        squarePshysicsBody.allowsRotation = false
        squarePshysicsBody.categoryBitMask = BitMask.FallingPiece
        squarePshysicsBody.contactTestBitMask = BitMask.All
        squarePshysicsBody.velocity = CGVectorMake(0, -100)
        self.physicsBody = squarePshysicsBody;
    }
}
