//
//  Piece.swift
//  tessera
//
//  Created by Stefan on 29/04/2024.
//

import Foundation

protocol Piece {

    func rotate() -> Void

    func moveLeft() -> Void

    func moveRight() -> Void

    func moveDown() -> Void

    func madeContact() -> Bool
}
