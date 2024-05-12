//
//  Square.swift
//  tessera
//
//  Created by Stefan on 19/03/2024.
//

import SpriteKit

class Square: Piece {

    private static let initialPositions: Array<CGPoint> = [
        CGPoint(x: MAX_X / 2, y: MAX_Y),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y),
        CGPoint(x: MAX_X / 2, y: MAX_Y + TILE_SIZE),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y + TILE_SIZE)
    ]

    var nodes: Array<SKSpriteNode> =  makeFourNodes(positions: Square.initialPositions, colour: NSColor.black)

    func rotate(state: State) -> Movement {
        // TODO
        return madeContact(state: state)
    }
}
