//
//  Character.swift
//  Projet3UI
//
//  Created by Raphaël Goupille on 08/05/2021.
//

import Foundation

class Character {
    
    var kind: Kind
    var name: String
    var health: Int
    var weapon: Weapons
    var magicWeapon: MagicWeapons
    var isAlive: Bool {
        if self.health <= 0 {
            return false
        } else {
            return true
        }
    }
    
    init(kind: Kind, name: String, health: Int, weapon: Weapons, magicWeapon: MagicWeapons) {
        self.kind = kind
        self.name = name
        self.health = health
        self.weapon = weapon
        self.magicWeapon = magicWeapon
    }
}
