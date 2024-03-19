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

    func initialisePiece() {
        self.color = NSColor.magenta
        self.size = CGSize(width: width, height: height)
        setPhyisics()
        setPositionTopOfScreen()
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

    private func setPositionTopOfScreen() {
        self.position = CGPoint(x: CGFloat(Float(xPosition)), y: frame.maxY - CGFloat(Float(height)))
    }

    private func setPhyisics() {
        let pshysicsBody = SKPhysicsBody.init(rectangleOf: self.frame.size)
        pshysicsBody.restitution = 0
        pshysicsBody.allowsRotation = false
        self.physicsBody = pshysicsBody;
    }
}
