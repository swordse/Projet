//
//  Team.swift
//  Projet3 commandLine
//
//  Created by Raphaël Goupille on 03/05/2021.
//

import Foundation

// game logic to start, to play and to end a game is here. Logic for the settings of the game is in Setting
class Game {
    
    // keep track of the player who is playing
    static var playerOneIsPlaying = true
    
    // array of all characters by team
    static var teamOne: [Character] = []
    static var teamTwo: [Character] = []
    
    // array of characters which will be affected to teamOne or teamTwo depending of the state of the game
    var fightingCharacters = [Character]()
    var opponentCharacters = [Character]()
    
    // index of the fighter and opponent choosen 
    var fighterIndex = Int()
    var opponentIndex = Int()
    var characterToHealIndex = Int()
    
    // 
    var fighter: Character {
        fightingCharacters[fighterIndex]
    }
    var opponent: Character {
        opponentCharacters[opponentIndex]
    }
    
    var characterToHeal: Character {
        fightingCharacters[characterToHealIndex]
    }

            
    
}



