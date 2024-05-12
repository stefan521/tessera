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
    private var delay: Int = 0

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

    func moveLeft() -> Bool {
        let movement = piece?.moveLeft(state: state)
        if movement == Movement.stop && isGameOver() { return true }
        return false
    }

    func moveRight() -> Bool {
        let movement = piece?.moveRight(state: state)
        if movement == Movement.stop && isGameOver() { return true }
        return false
    }

    func rotate() -> Bool {
        let movement = piece?.rotate(state: state)
        if movement == Movement.stop && isGameOver() { return true }
        return false
    }
    
    private func isGameOver() -> Bool {
        if let currentPiece = piece {
            return currentPiece.nodes.contains { $0.position.y > MAX_Y }
        }

        return false
    }

    private func generateNextPiece() -> Void {
        let randomNumber = Int.random(in: 1...4)
//        
//        if randomNumber == 1 { self.piece = Square() }
//        else if randomNumber == 2 {  self.piece = Bar() }
//        else if randomNumber == 3 { self.piece = Tau() }
//        else { self.piece = Zeta() }

        self.piece = Tau()

        self.piece!.nodes.forEach { node in boardNode.addChild(node) }
   }
}
