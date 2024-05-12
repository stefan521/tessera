//
//  Bar.swift
//  tessera
//
//  Created by Stefan on 12/05/2024.
//

import SpriteKit

class Bar: Piece {
    
    private var isVertical = true

    private static let initialPositions: Array<CGPoint> = [
        CGPoint(x: MAX_X / 2, y: MAX_Y + TILE_SIZE),
        CGPoint(x: MAX_X / 2, y: MAX_Y),
        CGPoint(x: MAX_X / 2, y: MAX_Y - TILE_SIZE),
        CGPoint(x: MAX_X / 2, y: MAX_Y - TILE_SIZE * 2)
    ]

    var nodes: Array<SKSpriteNode> = makeFourNodes(positions: Bar.initialPositions, colour: NSColor.systemIndigo)

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
            state.isFree(left(nodes[1].position)) &&
            state.isFree(right(nodes[1].position)) &&
            state.isFree(right(right(nodes[1].position)))
        ) {
            nodes[0].position = left(nodes[1].position)
            nodes[2].position = right(nodes[1].position)
            nodes[3].position = right(right(nodes[1].position))
        
            isVertical = false
        }
    
    }
    
    private func makeVertical(state: State) -> Void {
        if isVertical {
            return
        }
        
        if (
            state.isFree(above(nodes[1].position)) &&
            state.isFree(below(nodes[1].position)) &&
            state.isFree(below(below(nodes[1].position)))
        ) {
            nodes[0].position = above(nodes[1].position)
            nodes[2].position = below(nodes[1].position)
            nodes[3].position = below(below(nodes[1].position))
            isVertical = true
        }
    }
}
