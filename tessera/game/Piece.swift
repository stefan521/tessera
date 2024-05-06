//
//  Piece.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

protocol Piece {

    var nodes: Array<SKSpriteNode> { get set }

    func rotate() -> Movement

    func moveLeft() -> Movement

    func moveRight() -> Movement

    func moveDown() -> Movement
}
