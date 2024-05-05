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

    func moveLeft() {
        if (nodes.contains { node in node.position.x > MIN_X  }) {
            nodes.forEach { node in node.position = CGPoint(x: node.position.x - TILE_SIZE, y: node.position.y) }
        }
    }

    func moveRight() {
        if (nodes.contains { $0.position.x < MAX_X }) {
            nodes.forEach { node in node.position = CGPoint(x: node.position.x + TILE_SIZE, y: node.position.y) }
        }
    }

    func moveDown() {
        nodes.forEach { node in node.position = CGPoint(x: node.position.x, y: node.position.y - TILE_SIZE) }
    }

    func madeContact() -> Bool {
        return hitGround()
    }

    func rotate() {
    
    }

    private func hitGround() -> Bool {
        return nodes.contains { node in node.position.y <= MIN_Y + TILE_SIZE }
    }
}
