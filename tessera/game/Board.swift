//
//  Board.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

class Board: SKSpriteNode {
    
    private var currentPiece: Piece?
    private var ruleEnforcer: RuleEnforcer = RuleEnforcer()
    
    func initialiseBoard() {
        self.color = NSColor.darkGray
        self.size = CGSize(width: 100, height: 100)
    }

    func update() -> Bool {
        if let piece = currentPiece {
            piece.moveDown()
        } else {
            let piece: Square = Square()
            piece.initialisePiece(topY: frame.maxY)
            currentPiece = piece
            addChild(piece)
        }

        if (currentPiece!.madeContact() && ruleEnforcer.isGameOver()) {
            return true
        } else if (currentPiece!.madeContact()) {
            generateNextPiece()
        }
        
        return false
    }

    func moveLeft() -> Void {
        currentPiece?.moveLeft()
    }

    func moveRight() -> Void {
        currentPiece?.moveRight()
    }

    func rotate() -> Void {
        currentPiece?.rotate()
    }

    private func generateNextPiece() {
        let completeRows = ruleEnforcer.completeRows()
        // delete complete rows
        // update score
        // drop the things sitting on top
    }
}
