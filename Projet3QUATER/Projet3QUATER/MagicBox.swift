//
//  MagicBox.swift
//  Projet3QUATER
//
//  Created by Raphaël Goupille on 05/05/2021.
//

import Foundation

class MagicBox {
    
    
    func findBox() -> Bool {
        var findBox = false
        var random = Int.random(in: 1...5)
        if random == 1 || random == 2 {
            findBox = true
        } else {
            findBox = false
        }
        return findBox
    }

    
}
