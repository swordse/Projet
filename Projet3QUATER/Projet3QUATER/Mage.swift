//
//  Mage.swift
//  Projet3 commandLine
//
//  Created by Raphaël Goupille on 03/05/2021.
//

import Foundation


class Mage: Character {
    
    init(name: String) {
        super.init(kind: .mage, name: name, health: 30, weapon: .magicWand, magicWeapon: .superMagicWand)
        
    }
}
