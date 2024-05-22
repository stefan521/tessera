//
//  Bar.swift
//  tessera
//
//  Created by Stefan on 12/05/2024.
//

import SpriteKit

class Zeta: Piece {

    private var isVertical = false

    private static let initialPositions: Array<CGPoint> = [
        CGPoint(x: MAX_X / 2, y: MAX_Y),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y),
        CGPoint(x: MAX_X / 2 + TILE_SIZE, y: MAX_Y - TILE_SIZE),
        CGPoint(x: MAX_X / 2 + TILE_SIZE * 2, y: MAX_Y - TILE_SIZE)
    ]

    var nodes: Array<SKSpriteNode> = makeFourNodes(positions: Zeta.initialPositions, colour: NSColor.orange)

    func rotate(state: State) -> Movement {
        if (isVertical) { makeHorizontal(state: state) }
        else { makeVertical(state: state) }

        return madeContact(state: state)
    }
    
    private func makeHorizontal(state: State) -> Void {
        if (!isVertical) {
            return
        }
        
        if (
            state.isFree(below(nodes[1].position)) &&
            state.isFree(right(below(nodes[1].position)))
        ) {
            nodes[2].position = below(nodes[1].position)
            nodes[3].position = right(below(nodes[1].position))
        
            isVertical = false
        }
    
    }
    
    private func makeVertical(state: State) -> Void {
        if isVertical {
            return
        }
        
        if (
            state.isFree(above(nodes[1].position)) &&
            state.isFree(left(below(nodes[1].position)))
        ) {
            nodes[2].position = above(nodes[1].position)
            nodes[3].position = left(below(nodes[1].position))
            isVertical = true
        }
    }
}
