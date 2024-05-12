//
//  Bar.swift
//  tessera
//
//  Created by Stefan on 12/05/2024.
//

import SpriteKit

class Tau: Piece {

    private static let initialPositions: Array<CGPoint> = [
        CGPoint(x: MAX_X / 2, y: MAX_Y ),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y),
        CGPoint(x: MAX_X / 2 + TILE_SIZE * 2, y: MAX_Y),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y + TILE_SIZE)
    ]

    var nodes: Array<SKSpriteNode> = makeFourNodes(positions: Tau.initialPositions, colour: NSColor.systemBlue)

    func rotate(state: State) -> Movement {
        // TODO
        return madeContact(state: state)
    }
}
