//
//  State.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

class State: CustomStringConvertible {
    
    private var positions: Dictionary<String, Optional<SKNode>> = [:]
    private let horizontal = (0...Int(BOARD_WIDTH / TILE_SIZE) - 1).map { $0 * Int(TILE_SIZE) }
    private let vertical = (0...Int(BOARD_HEIGHT / TILE_SIZE) - 1).map { $0 * Int(TILE_SIZE) }

    var description: String {
        var stringState = "********************\n"
        for y in vertical {
            var row = ""
            for x in horizontal {
                let hasTile = positions[key(x, y)].map { $0 != nil } ?? false
                row +=  hasTile ? "O" :  "_"
            }
            stringState = "\(row)\n\(stringState)"
        }
        return "****** State *******\n" + stringState
    }

    init () {
        buildPositions()
    }

    func isFree(_ point: CGPoint) -> Bool {
        return positions[key(point.x, point.y)] ?? Optional.none == nil
    }
    
    func clearCompletedRows() -> Void {
        for x in horizontal {
            for y in vertical {
                // TODO
                let k = key(x, y)
            }
        }
    }

    func setAt(_ point: CGPoint, _ node: SKNode) -> Void {
        positions.updateValue(node, forKey: key(point.x, point.y))
    }

    private func buildPositions() -> Void {
        for x in horizontal {
            for y in vertical {
                positions[key(x, y)] = Optional.none
            }
        }
    }

    private func key(_ x: Int, _ y: Int) -> String { return "(\(x / Int(TILE_SIZE)),\(y / Int(TILE_SIZE))" }

    private func key(_ x: CGFloat, _ y: CGFloat) -> String { return key(Int(x), Int(y)) }
}

enum Movement {
    case fall
    case stop
}
