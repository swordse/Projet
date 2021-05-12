//
//  Soldier.swift
//  Projet3UI
//
//  Created by Raphaël Goupille on 08/05/2021.
//

import Foundation


class Soldier: Character {
    
    init(name: String) {
        super.init(kind: .soldier, name: name, health: 70, weapon: .sword, magicWeapon: .superSword)
    }
    
}
