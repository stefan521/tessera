//
//  Square.swift
//  tessera
//
//  Created by Stefan on 19/03/2024.
//

import SpriteKit

class Square: Piece {

    var nodes: Array<SKSpriteNode> = Array()
    
    init () {
        let node = SKSpriteNode()
        node.anchorPoint = CGPoint(x: 0, y: 0)
        node.color = NSColor.black
        node.size = CGSize(width: TILE_SIZE, height: TILE_SIZE)
        node.position = CGPoint(x: MAX_X / 2, y: MAX_Y)
        nodes.append(node)
    }

    func moveLeft() {
        if (nodes.contains { node in node.position.x > MIN_X  }) {
            nodes.forEach { node in node.position = CGPoint(x: node.position.x - TILE_SIZE, y: node.position.y) }
        }
    }

    func moveRight() {
        if (nodes.contains(where: { node in node.position.x < MAX_X })) {
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
