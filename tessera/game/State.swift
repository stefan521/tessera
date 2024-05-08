//
//  State.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

class State {
    private var positions: Dictionary<String, Optional<SKNode>> = [:]
    
    init () {
        buildPositions()
    }

    private func buildPositions() -> Void {
        var x = 0.0

        while x <= BOARD_WIDTH {
            var y = 0.0

            while y <= BOARD_HEIGHT {
                positions.updateValue(Optional.none, forKey: key(x, y))
                y += TILE_SIZE
            }

            x += TILE_SIZE
        }
    }

    private func key(_ x: CGFloat, _ y: CGFloat) -> String {
        return "(\(Int(x)),\(Int(y)))"
    }

    func nodeAt(_ point: CGPoint) -> Optional<SKNode> {
        return positions[key(point.x, point.y)] ?? Optional.none
    }

    func clearAt(_ point: CGPoint) -> Void {
        positions.updateValue(Optional.none, forKey: key(point.x, point.y))
    }

    func setAt(_ point: CGPoint, _ node: SKNode) -> Void {
        positions.updateValue(node, forKey: key(point.x, point.y))
    }
}

enum Movement {
    case fall
    case stop
}
