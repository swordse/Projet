//
//  Dwarf.swift
//  Projet3UI
//
//  Created by Raphaël Goupille on 08/05/2021.
//

import Foundation


class Dwarf: Character {
    
    
    init(name: String) {
        super.init(kind: .dwarf, name: name, health: 50, weapon: .axe, magicWeapon: .superAxe)
    }
    
}
