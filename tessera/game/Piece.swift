//
//  Piece.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

protocol Piece {

    var nodes: Array<SKSpriteNode> { get set }

    func rotate(state: State) -> Movement

    func moveLeft(state: State) -> Movement

    func moveRight(state: State) -> Movement

    func moveDown(state: State) -> Movement
}
