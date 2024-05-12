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

    func clearCompletedRows() -> Array<SKNode> {
        var removedNodes: Array<SKNode> = []

        for y in vertical {
            var nodesOnRow: Array<SKNode> = []

            for x in horizontal { positions[key(x, y)].map { n in nodesOnRow.append(n)} }

            if nodesOnRow.count == horizontal.count {
                removedNodes.append(contentsOf: nodesOnRow)
                clearRow(y)
            }
        }

        dropSuspendedRows()

        return removedNodes
    }

    func dropSuspendedRows() -> Void {
        for y in vertical.dropFirst() {
            let nonEmptyRow = horizontal.contains { x in positions[key(x, y)] != nil }
            let canDrop = horizontal.allSatisfy { x in positions[key(x, y - 1)] == nil }

            if (nonEmptyRow && canDrop) {
                horizontal.forEach { x in
                    if let node = positions[key(x, y)] {
                        node.position = CGPoint(x: node.position.x, y: node.position.y - TILE_SIZE)
                        positions[key(x, y - 1)] = node
                        positions[key(x, y)] = Optional.none
                    }
                }
                dropSuspendedRows()
            }
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
