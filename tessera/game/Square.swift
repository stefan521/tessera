//
//  Square.swift
//  tessera
//
//  Created by Stefan on 19/03/2024.
//

import SpriteKit

class Square: SKSpriteNode, Piece {
    
    private let width: Int = TILE_SIZE * 2
    private let height: Int = TILE_SIZE * 2
    private var xPosition: Int = -120

    func initialisePiece(topY: CGFloat) {
        self.color = NSColor.orange
        self.size = CGSize(width: width, height: height)
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

    func moveDown() {
        
    }

    func madeContact() -> Bool {
        return false
    }

    func rotate() {
    
    }

    private func setPositionTopOfScreen(topY: CGFloat) {
        self.position = CGPoint(x: CGFloat(Float(xPosition)), y: topY - CGFloat(Float(height)))
    }
}
