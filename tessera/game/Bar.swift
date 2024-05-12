//
//  Bar.swift
//  tessera
//
//  Created by Stefan on 12/05/2024.
//

import SpriteKit

class Bar: Piece {

    private static let initialPositions: Array<CGPoint> = [
        CGPoint(x: MAX_X / 2, y: MAX_Y + TILE_SIZE),
        CGPoint(x: MAX_X / 2, y: MAX_Y),
        CGPoint(x: MAX_X / 2, y: MAX_Y - TILE_SIZE),
        CGPoint(x: MAX_X / 2, y: MAX_Y - TILE_SIZE * 2)
    ]

    var nodes: Array<SKSpriteNode> = makeFourNodes(positions: Bar.initialPositions, colour: NSColor.systemIndigo)

    func rotate(state: State) -> Movement {
        // TODO
        return madeContact(state: state)
    }
}
