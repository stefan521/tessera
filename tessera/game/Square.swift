//
//  Square.swift
//  tessera
//
//  Created by Stefan on 19/03/2024.
//

import SpriteKit

class Square: SKSpriteNode, Piece {

    func initialisePiece(topY: CGFloat) {
        self.color = NSColor.black
        self.size = CGSize(width: CGFloat(10), height: CGFloat(10))
        setPositionTopOfScreen(topY: topY)
    }

    func moveLeft() {
//        if (self.position.x > MIN_X + CGFloat(width)) {
        self.position = CGPoint(x: self.position.x - 10, y: self.position.y)
//        }
    }

    func moveRight() {
//        if (self.position.x < MAX_X - CGFloat(width)) {
            self.position = CGPoint(x: self.position.x + 10, y: self.position.y)
//        }
    }

    func moveDown() {
        self.position = CGPoint(x: self.position.x, y: self.position.y - 10)
    }

    func madeContact() -> Bool {
        return false
    }

    func rotate() {
    
    }

    private func setPositionTopOfScreen(topY: CGFloat) {
        self.position = CGPoint(x: 0, y: 0)
    }
}
