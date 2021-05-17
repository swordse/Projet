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
    
    func findBox() -> Bool {
        var findBox = false
        let random = Int.random(in: 1...5)
        if random == 1 || random == 2 || random == 3 {
            findBox = true
        } else {
            findBox = false
        }
        return findBox
    }
    
    func attack(against opponent: Character) {
        print("\n" + Constants.separator)
        if self.findBox() {
            opponent.health -= self.magicWeapon.rawValue
            print("You have find a MAGIC BOX which contain a \(self.magicWeapon). It can attack: \(self.magicWeapon.rawValue)")
            print("\n" + Constants.separator)
        } else {
        opponent.health -= self.weapon.rawValue
        }
        if opponent.isAlive {
            print("\(opponent.name) has been attacked. His remaining life is: \(opponent.health)")
        } else {
            print("Ohh! MY GOSH!!!! \(opponent.name) has been killed!!!")
        }
        
    }
    
}

