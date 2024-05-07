//
//  State.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

class State {
    private var positions: Dictionary<String, Optional<SKNode>> = [:]
    
    private func fromPoint(_ point: CGPoint) -> String {
        let x = Int(point.x)
        let y = Int(point.y)
        return "(\(x),\(y))"
    }

    func nodeAt(_ point: CGPoint) -> Optional<SKNode> {
        return positions[fromPoint(point)] ?? Optional.none
    }

    func clearAt(_ point: CGPoint) -> Void {
        positions.updateValue(Optional.none, forKey: fromPoint(point))
    }

    func setAt(_ point: CGPoint, _ node: SKNode) -> Void {
        positions.updateValue(node, forKey: fromPoint(point))
    }
}

enum Movement {
    case fall
    case stop
}
