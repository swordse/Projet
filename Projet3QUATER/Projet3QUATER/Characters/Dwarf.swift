//
//  Dwarf.swift
//  Projet3 commandLine
//
//  Created by Raphaël Goupille on 03/05/2021.
//

import Foundation

class Dwarf: Character {
    
    
    init(name: String) {
        super.init(kind: .dwarf, name: name, health: 50, weapon: .axe, magicWeapon: .superAxe)
    }
    
}
