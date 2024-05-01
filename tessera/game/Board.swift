//
//  Board.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

class Board {
    
    private var boardNode: SKNode
    private var currentPiece: Piece?
    private var ruleEnforcer: RuleEnforcer = RuleEnforcer()
    
    init (node: SKNode) {
        boardNode = node
    }

    func update() -> Bool {
        if let piece = currentPiece {
            piece.moveDown()
        } else {
            let piece: Square = Square()
            piece.initialisePiece(topY: boardNode.frame.maxY)
            currentPiece = piece
            boardNode.addChild(piece)
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
