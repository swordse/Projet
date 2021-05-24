//
//  Fight.swift
//  Projet3UI
//
//  Created by Raphaël Goupille on 10/05/2021.
//

import Foundation

class Game : TeamFactory {
    

    // array of characters which will be affected to teamOne or teamTwo depending of the state of the game
    var fightingCharacters = [Character]()
    var opponentCharacters = [Character]()
    
    
    func fight(teams: [Team], fighterTeamIndex: Int, fighterIndex: Int, opponentIndex: Int) -> Bool {
        
        var opponentTeamIndex: Int { fighterTeamIndex == 0 ? 1 : 0 }
        
        teams[opponentTeamIndex].characters[opponentIndex].health -= teams[fighterTeamIndex].characters[fighterIndex].weapon.rawValue
           
        return checkWin(teams: teams, opponentTeamIndex: opponentTeamIndex)
    }
    
    func checkWin(teams: [Team], opponentTeamIndex: Int) -> Bool {
        var numberOfDead = 0
        for character in teams[opponentTeamIndex].characters {
            if !character.isAlive {
                numberOfDead += 1
            }
        }
        if numberOfDead == 3 {
            return true
        } else {
        return false
        }
}

}

