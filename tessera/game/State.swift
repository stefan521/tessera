//
//  State.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

class State: CustomStringConvertible {
    
    private var positions: Dictionary<String, SKNode> = [:]
    private let horizontal = (0...Int(BOARD_WIDTH / TILE_SIZE) - 1).map { $0 * Int(TILE_SIZE) }
    private let vertical = (0...Int(BOARD_HEIGHT / TILE_SIZE) - 1).map { $0 * Int(TILE_SIZE) }

    var description: String {
        var stringState = "********************\n"
        for y in vertical {
            var row = ""
            for x in horizontal {
                row += positions[key(x, y)] != nil ? "O" :  "_"
            }
            stringState = "\(row)\n\(stringState)"
        }
        return "****** State *******\n" + stringState
    }

    func isFree(_ point: CGPoint) -> Bool { return positions[key(point.x, point.y)] == nil }

    func clearCompletedRows() -> Void {
        for y in vertical {
            var tilesOnRow = 0
            for x in horizontal { if positions[key(x, y)] != nil { tilesOnRow += 1 } }
            if tilesOnRow == horizontal.count { clearRow(y) }
        }
    }

    func setAt(_ point: CGPoint, _ node: SKNode) -> Void {
        positions.updateValue(node, forKey: key(point.x, point.y))
    }

    private func clearRow(_ y: Int) -> Void { for x in horizontal { positions.removeValue(forKey: key(x, y)) } }

    private func key(_ x: Int, _ y: Int) -> String { return "(\(x / Int(TILE_SIZE)),\(y / Int(TILE_SIZE))" }

    private func key(_ x: CGFloat, _ y: CGFloat) -> String { return key(Int(x), Int(y)) }
}

enum Movement {
    case fall
    case stop
}
