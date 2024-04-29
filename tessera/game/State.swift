//
//  State.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

struct State {
    static let TILE_SIZE: Int = 20
    static let WINDOW_WIDTH: CGFloat = 600.0
    static let WINDOW_HEIGHT: CGFloat = 700.0
    static let SCORE_PANEL_WIDTH: CGFloat = 200.0
    static let SCORE_PANEL_HEIGHT: CGFloat = WINDOW_HEIGHT
    static let MIN_X: CGFloat = -WINDOW_WIDTH / 2
    static let MAX_X: CGFloat = WINDOW_WIDTH / 2 - SCORE_PANEL_WIDTH
}
