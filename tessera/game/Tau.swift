//
//  Bar.swift
//  tessera
//
//  Created by Stefan on 12/05/2024.
//

import SpriteKit

class Tau: Piece {

    private var rotation = 0

    private static let initialPositions: Array<CGPoint> = [
        CGPoint(x: MAX_X / 2, y: MAX_Y ),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y),
        CGPoint(x: MAX_X / 2 + TILE_SIZE * 2, y: MAX_Y),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y + TILE_SIZE)
    ]

    var nodes: Array<SKSpriteNode> = makeFourNodes(positions: Tau.initialPositions, colour: NSColor.green)

    func rotate(state: State) -> Movement {
        if (rotation == 0) {
            rotate90(state)
        } else if (rotation == 90) {
            rotate180(state)
        } else if (rotation == 180) {
            rotate270(state)
        } else if (rotation == 270) {
            rotate0(state)
        }

        return madeContact(state: state)
    }
    
    private func rotate0(_ state: State) -> Void {
        if (rotation != 270) {
            return
        }
        
        if (
            state.isFree(above(nodes[3].position)) &&
            state.isFree(left(nodes[3].position)) &&
            state.isFree(right(nodes[3].position))
        ) {
            nodes[0].position = above(nodes[3].position)
            nodes[1].position = left(nodes[3].position)
            nodes[2].position = right(nodes[3].position)

            rotation = 0
        }
    }
    
    private func rotate90(_ state: State) -> Void {
        if (rotation != 0) {
            return
        }
        
        if (
            state.isFree(above(nodes[3].position)) &&
            state.isFree(below(nodes[3].position)) &&
            state.isFree(right(nodes[3].position))
        ) {
            nodes[0].position = above(nodes[3].position)
            nodes[1].position = below(nodes[3].position)
            nodes[2].position = right(nodes[3].position)

            rotation = 90
        }
    }
    
    private func rotate180(_ state: State) -> Void {
        if (rotation != 90) {
            return
        }
        
        if (
            state.isFree(below(nodes[3].position)) &&
            state.isFree(left(nodes[3].position)) &&
            state.isFree(right(nodes[3].position))
        ) {
            nodes[0].position = below(nodes[3].position)
            nodes[1].position = left(nodes[3].position)
            nodes[2].position = right(nodes[3].position)

            rotation = 180
        }
    }
    
    private func rotate270(_ state: State) -> Void {
        if (rotation != 180) {
            return
        }

        if (
            state.isFree(above(nodes[3].position)) &&
            state.isFree(left(nodes[3].position)) &&
            state.isFree(right(nodes[3].position))
        ) {
            nodes[0].position = above(nodes[3].position)
            nodes[1].position = left(nodes[3].position)
            nodes[2].position = below(nodes[3].position)

            rotation = 270
        }
    }
}
