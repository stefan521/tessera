//
//  Board.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

class Board {
    
    private var boardNode: SKNode
    private var piece: Piece?
    private var state: State = State()

    init (node: SKNode) {
        boardNode = node
    }

    func update() -> Bool {
        if (piece == nil) {
            generateNextPiece()
        }

        let movement = piece!.moveDown(state: state)

        if (movement == Movement.stop && isGameOver()) {
            return true
        }

        if (movement == Movement.stop) {
            piece!.nodes.forEach { node in state.setAt(node.position, node) }

            generateNextPiece()

            let nodesToRemove = state.clearCompletedRows()
            boardNode.removeChildren(in: nodesToRemove)
        }

        return false
    }

    func moveLeft() -> Void {
        let movement = piece?.moveLeft(state: state)
    }

    func moveRight() -> Void {
        let movement = piece?.moveRight(state: state)
    }

    func rotate() -> Void {
        let movement = piece?.rotate(state: state)
    }
    
    private func isGameOver() -> Bool {
        // TODO
        return false
    }

    private func generateNextPiece() -> Void {
        self.piece = Square()
        self.piece!.nodes.forEach { node in boardNode.addChild(node) }
   }
}
