//
//  Game.swift
//  Projet3UI
//
//  Created by Raphaël Goupille on 08/05/2021.
//

import Foundation

class Game {
    
    static var playerOneIsPlaying = true
    
    func createCharacter(dwarfName: String, mageName: String, soldierName: String, playerOneIsPlaying: Bool) {
        
        let dwarf = Dwarf(name: dwarfName)
        let mage = Mage(name: mageName)
        let soldier = Soldier(name: soldierName)
        
        if playerOneIsPlaying {
            Teams.teamOne.append(dwarf)
            Teams.teamOne.append(mage)
            Teams.teamOne.append(soldier)
        } else {
            Teams.teamOne.append(dwarf)
            Teams.teamOne.append(mage)
            Teams.teamOne.append(soldier)
        }
        
    }
    
    
}
