//
//  State.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

class State: CustomStringConvertible {
    
    private var positions: Dictionary<String, Optional<SKNode>> = [:]

    var description: String {
        var str = "***** State *****\n"
        var y = BOARD_HEIGHT
        while y > 0 {
            str += Int(y / TILE_SIZE ).description.padding(toLength: 3, withPad: " ", startingAt: 0)
            var x = 0.0
            while x < BOARD_WIDTH {
                let hasTile = positions[key(x, y)].map { $0 != nil } ?? false
                str += hasTile ? "O" :  "_"
                x += TILE_SIZE
            }
            str += "\n"
            y -= TILE_SIZE
        }

        str += "*****************\n"
        
        return str
    }

    init () {
        buildPositions()
    }

    func nodeAt(_ point: CGPoint) -> Optional<SKNode> {
        return positions[key(point.x, point.y)] ?? Optional.none
    }

    func isFree(_ point: CGPoint) -> Bool {
        return nodeAt(point) == nil
    }

    func clearAt(_ point: CGPoint) -> Void {
        positions.updateValue(Optional.none, forKey: key(point.x, point.y))
    }

    func clearRow(_ row: Int) -> Void {
        // TODO
    }

    func setAt(_ point: CGPoint, _ node: SKNode) -> Void {
        positions.updateValue(node, forKey: key(point.x, point.y))
    }
    
    private func buildPositions() -> Void {
        var x = 0.0

        while x < BOARD_WIDTH {
            var y = 0.0

            while y < BOARD_HEIGHT {
                positions.updateValue(Optional.none, forKey: key(x, y))
                y += TILE_SIZE
            }

            x += TILE_SIZE
        }
    }

    private func key(_ x: CGFloat, _ y: CGFloat) -> String {
        return "(\(Int(x)),\(Int(y)))"
    }
}

enum Movement {
    case fall
    case stop
}
