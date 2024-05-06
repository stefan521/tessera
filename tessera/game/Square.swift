//
//  Square.swift
//  tessera
//
//  Created by Stefan on 19/03/2024.
//

import SpriteKit

class Square: Piece {

    private static var initialPositions: Array<CGPoint> = [
        CGPoint(x: MAX_X / 2, y: MAX_Y),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y),
        CGPoint(x: MAX_X / 2, y: MAX_Y + TILE_SIZE),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y + TILE_SIZE)
    ]

    var nodes: Array<SKSpriteNode> = (0...3).map { index in
        let node = SKSpriteNode()
        node.anchorPoint = CGPoint(x: 0, y: 0)
        node.color = NSColor.black
        node.size = CGSize(width: TILE_SIZE, height: TILE_SIZE)
        node.position = initialPositions[index]
        return node
    }

    init () {}

    func moveLeft() -> Movement {
        if (nodes.allSatisfy { $0.position.x > MIN_X  }) {
            nodes.forEach { node in node.position = CGPoint(x: node.position.x - TILE_SIZE, y: node.position.y) }
        }

        return madeContact()
    }

    func moveRight() -> Movement {
        if (nodes.allSatisfy { $0.position.x < MAX_X - TILE_SIZE }) {
            nodes.forEach { node in node.position = CGPoint(x: node.position.x + TILE_SIZE, y: node.position.y) }
        }

        return madeContact()
    }

    func moveDown() -> Movement {
        nodes.forEach { node in node.position = CGPoint(x: node.position.x, y: node.position.y - TILE_SIZE) }
        return madeContact()
    }

    func rotate() -> Movement {
        // TODO
        return madeContact()
    }

    private func madeContact() -> Movement {
        if (hitGround()) {
            return Movement.stop
        }
        
        return Movement.fall
    }

    private func hitGround() -> Bool {
        return nodes.contains { $0.position.y <= MIN_Y }
    }
}
