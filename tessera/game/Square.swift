//
//  Square.swift
//  tessera
//
//  Created by Stefan on 19/03/2024.
//

import SpriteKit

class Square: SKSpriteNode, Piece {
    
    private let pieceWidth: CGFloat = 40
    private let pieceHeight: CGFloat = 40

    func initialisePiece() {
        self.color = NSColor.black
        self.size = CGSize(width: CGFloat(pieceWidth), height: CGFloat(pieceHeight))
        self.position = CGPoint(x: 0, y: MAX_Y)
    }

    func moveLeft() {
//        if (self.position.x > MIN_X + CGFloat(width)) {
        self.position = CGPoint(x: self.position.x - pieceWidth, y: self.position.y)
//        }
    }

    func moveRight() {
//        if (self.position.x < MAX_X - CGFloat(width)) {
            self.position = CGPoint(x: self.position.x + pieceWidth, y: self.position.y)
//        }
    }

    func moveDown() {
        self.position = CGPoint(x: self.position.x, y: self.position.y - pieceWidth)
    }

    func madeContact() -> Bool {
        return hitGround()
    }

    func rotate() {
    
    }

    private func hitGround() -> Bool {
        return self.position.y <= MIN_Y + pieceHeight
    }

    private func setPositionTopOfScreen(topY: CGFloat) {
        self.position = CGPoint(x: 0, y: 0)
    }
}
