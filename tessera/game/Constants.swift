//
//  Constants.swift
//  tessera
//
//  Created by Stefan on 19/03/2024.
//

import SpriteKit

let TILE_SIZE: Int = 20
let WINDOW_WIDTH: CGFloat = 600.0
let WINDOW_HEIGHT: CGFloat = 700.0
let SCORE_PANEL_WIDTH: CGFloat = 200.0
let SCORE_PANEL_HEIGHT: CGFloat  = WINDOW_HEIGHT
let MIN_X: CGFloat = -WINDOW_WIDTH / 2
let MAX_X: CGFloat = WINDOW_WIDTH / 2 - SCORE_PANEL_WIDTH

struct BitMask {
    static let FallingPiece: UInt32 = 0x1
    static let Static: UInt32 = 0x1 << 1
    static let All: UInt32 = UInt32.max
}
