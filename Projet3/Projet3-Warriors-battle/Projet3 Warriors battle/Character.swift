//
//  Character.swift
//  Projet3 Warriors battle
//
//  Created by Raphaël Goupille on 10/05/2021.
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
    
    enum Weapons: Int {
        case axe = 100
        case magicWand = 5
        case sword = 7
    }
    
    enum MagicWeapons: Int {
        case superAxe = 20
        case superMagicWand = 15
        case superSword = 14
    }
    
    enum Kind: String {
        case dwarf
        case mage
        case soldier
    }
    
    func attack(against opponent: Character) {
        opponent.health -= self.weapon.rawValue
    }
    
}

