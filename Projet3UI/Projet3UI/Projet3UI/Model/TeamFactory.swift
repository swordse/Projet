//
//  Game.swift
//  Projet3UI
//
//  Created by Raphaël Goupille on 08/05/2021.
//

import Foundation

class TeamFactory {
    

    // keep track of the player who is playing
    static var playerOneIsPlaying = true
    
    func teamCreator(teamName: String?, charactersKind: [String], charactersName: [String]) -> Team {
        
        var nameTeam = String()
        
        if let teamName = teamName {
            nameTeam = teamName
        }
        
        let team = Team(name: nameTeam)
        team.characters = createCharacters(charactersKind: charactersKind, charactersName: charactersName)
        
        return team
    }

    // func to create the 3 characters of each team
    func createCharacters(charactersKind: [String], charactersName: [String]) -> [Character] {
        
        var characters = [Character]()
        
        for i in 0 ..< 3 {
            if charactersKind[i] == "dwarf" {
                let dwarf = Dwarf(name: charactersName[i])
                characters.append(dwarf)
            }
            if charactersKind[i] == "mage" {
                let mage = Mage(name: charactersName[i])
                characters.append(mage)
            }
            if charactersKind[i] == "soldier" {
                let soldier = Soldier(name: charactersName[i])
                characters.append(soldier)
            }
            if charactersKind[i] == "giant" {
                let giant = Giant(name: charactersName[i])
                characters.append(giant)
            }
        }
        return characters
    }
    
    
}
