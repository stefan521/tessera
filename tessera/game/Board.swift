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
    private var state: State = State()

    init (node: SKNode) {
        boardNode = node
    }

    func update() -> Bool {
        let piece = currentPiece ?? generateNextPiece()
        let pieceMovement = piece.moveDown(state: state)
        
        if (pieceMovement == Movement.fall) {
            return false
        }

        piece.nodes.forEach { node in state.setAt(node.position, node) }

        generateNextPiece()
        
        print(state)

        return ruleEnforcer.isGameOver()
    }

    func moveLeft() -> Void {
        currentPiece?.moveLeft(state: state)
    }

    func moveRight() -> Void {
        currentPiece?.moveRight(state: state)
    }

    func rotate() -> Void {
        currentPiece?.rotate(state: state)
    }

    private func generateNextPiece() -> Piece {
        // let completeRows = ruleEnforcer.completeRows()
        // delete complete rows
        // update score
        // drop the things sitting on top
        let piece: Square = Square()
        self.currentPiece = piece
        piece.nodes.forEach { node in boardNode.addChild(node) }
        return piece
   }
}
