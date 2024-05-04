//
//  Piece.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import SpriteKit

protocol Piece {

    var nodes: Array<SKSpriteNode> { get set }

    func rotate() -> Void

    func moveLeft() -> Void

    func moveRight() -> Void

    func moveDown() -> Void

    func madeContact() -> Bool
}
