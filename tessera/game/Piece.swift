//
//  Piece.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

protocol Piece {

    var nodes: Array<SKSpriteNode> { get }

    func rotate(state: State) -> Movement

}

extension Piece {
    
    func moveLeft(state: State) -> Movement {
        if (nodes.allSatisfy { n in n.position.x > MIN_X && state.isFree(left(n.position))}) {
            nodes.forEach { n in n.position = left(n.position) }
        }

        return madeContact(state: state)
    }

    func moveRight(state: State) -> Movement {
        if (nodes.allSatisfy { n in n.position.x < MAX_X - TILE_SIZE && state.isFree(right(n.position)) }) {
            nodes.forEach { node in node.position = right(node.position) }
        }

        return madeContact(state: state)
    }

    func moveDown(state: State) -> Movement {
        if (nodes.allSatisfy { n in n.position.y > MIN_Y && state.isFree(below(n.position))}) {
            nodes.forEach { node in node.position = below(node.position) }
        }

        return madeContact(state: state)
    }

    func below(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x, y: point.y - TILE_SIZE)
    }

    func above(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x, y: point.y + TILE_SIZE)
    }

    func left(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x - TILE_SIZE, y: point.y)
    }

    func right(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x + TILE_SIZE, y: point.y)
    }

    static func makeFourNodes(positions: Array<CGPoint>, colour: NSColor) -> Array<SKSpriteNode> {
        (0...3).map { index in
            let node = SKSpriteNode()
            node.anchorPoint = CGPoint(x: 0, y: 0)
            node.color = colour
            node.size = CGSize(width: TILE_SIZE, height: TILE_SIZE)
            node.position = positions[index]
            return node
        }
    }
    
    func madeContact(state: State) -> Movement {
        if (hitGround()) {
            return Movement.stop
        }

        let hitPiece = nodes.contains { node in !state.isFree(below(node.position)) }

        if (hitPiece) {
            return Movement.stop
        }

        return Movement.fall
    }

    private func hitGround() -> Bool {
        return nodes.contains { $0.position.y <= MIN_Y }
    }
}
