//
//  Fight.swift
//  Projet3 commandLine
//
//  Created by Raphaël Goupille on 04/05/2021.
//

import Foundation

class Fight: Game {
    
    var numberOfTurn: Int = 1
    
    var magicBox = false

    
    func fight() {
        
        // check which player is playing and assign the corresponding characters
        if Game.playerOneIsPlaying {
            fightingCharacters = Game.teamOne
            opponentCharacters = Game.teamTwo
        } else {
            fightingCharacters = Game.teamTwo
            opponentCharacters = Game.teamOne
        }
        Setting.spacer()
        print("\(Game.playerOneIsPlaying ? "Player ONE:" : "Player TWO:") choose your fighter for this round:"
        + "\n")
        showCharactersChoice(characters: fightingCharacters)
        fighterIndex = readIndex()
        magicBox = MagicBox().findBox()
        
        if magicBox {
            print("\n"
                    + "------   You have found a MAGIC BOX which contains a \(fighter.magicWeapon). It can damage \(fighter.magicWeapon.rawValue) points.   ------"
            + "\n")
        }
        
        if fighter.kind == .mage {
            Setting.spacer()
            print("\(Game.playerOneIsPlaying ? "Player One:" : "Player Two:") choose the character of your team you want to heal:"
                    + "\n")
            showCharactersChoice(characters: fightingCharacters)
            characterToHealIndex = readIndex()
            fightResult()
        } else {
            Setting.spacer()
            print("\(Game.playerOneIsPlaying ? "Player One:" : "Player Two:") choose your opponnent :"
                + "\n")
            showCharactersChoice(characters: opponentCharacters)
            opponentIndex = readIndex()
            fightResult()
        }
        
    }
    // show the fighter or opponent characters
    func showCharactersChoice(characters: [Character])  {
        // Player choose among his characters
//        print(fightingCharacters.count)
        var number = 1
        for character in characters {
            if character.isAlive == true {
                print("\(number). \(character.name) - life: \(character.health) - weapon: \(character.weapon) - damage: \(character.weapon.rawValue)")
                number += 1
            }
        }
    }
    // read the index of the choosen character
    func readIndex() -> Int {
        var index = Int()
        if let choice = readLine() {
            switch choice {
            case "1":
                index = 0
            case "2":
                index = 1
            case "3":
                index = 2
            default:
                print("YOU MUST CHOOSE A NUMBER BETWEEN 1 OR 3.")
                readIndex()
            }
        }
        return index
    }
    
    func fightResult() {
    
        // the choosen fighter is the mage to heal a member team
        if fighter.kind == .mage {
            if magicBox {
                characterToHeal.health += fighter.magicWeapon.rawValue
            } else {
            characterToHeal.health += fighter.weapon.rawValue
            }
        } else {
            if magicBox {
                opponent.health -= fighter.magicWeapon.rawValue
            } else {
                opponent.health -= fighter.weapon.rawValue
            }
        }
        showFightResult()
    }
  
    func showFightResult() {
    if fighter.kind == .mage {
        Setting.line()
            print("\n"
                  + "\n\(characterToHeal.name) has been healed. His life is now \(characterToHeal.health)."
                  + "\n")
        Setting.line()
    } else if opponent.isAlive {
        Setting.line()
        print("\(opponent.name) has been attacked!!"
                + "\n\(opponent.name) has \(opponent.health) life points left.")
        Setting.line()
        
    } else {
        Setting.line()
        print("OHHH MY GOSH!!!! \(opponent.name) has been killed!!!")
        Setting.line()
        Game.playerOneIsPlaying ? Game.teamTwo.remove(at: opponentIndex) : Game.teamOne.remove(at: opponentIndex)
    }
        Game.playerOneIsPlaying.toggle()
        numberOfTurn += 1
        checkWin()
    }
    
    // check if a player has won ie. if all characters of a team are dead
    func checkWin() {
        if Game.teamOne.allSatisfy({ character in
            character.isAlive == false
        }) {
            Setting.line()
            Setting.line()
            print("\n"
                  + "\n-------   TEAM ONE WINS !!!!   -------"
                    + "\n-------   CONGRATULATIONS   -------")
            Setting.line()
            Setting.line()
            displayStats(team: Game.teamOne)
        }
        if Game.teamTwo.allSatisfy({ character in
            character.isAlive == false
        }) {
            Setting.line()
            Setting.line()
            print("\n"
                  + "\n-------   TEAM ONE WINS !!!!   -------"
                    + "\n-------   CONGRATULATIONS   -------")
            Setting.line()
            Setting.line()
            displayStats(team: Game.teamOne)
        }
        else {
            fight()
        }
    }
    
    func displayStats(team: [Character]) {
        Setting.spacer()
        Setting.spacer()
        print("You have killed all the other team's characters in: \(numberOfTurn) turns."
                + "\nAfter this fight, here is your team state:")
        for character in team {
            print("Name: \(character.name) - type: \(character.kind) - life: \(character.health) - weapon: \(character.weapon) ")
        }
        Setting.spacer()
        Setting.spacer()
        
    }
    
    func resetGame() {
        Game.playerOneIsPlaying = true
        
        // array of all characters by team
        Game.teamOne.removeAll()
        Game.teamTwo.removeAll()
        
        // array of characters which will be affected to teamOne or teamTwo depending of the state of the game
        fightingCharacters.removeAll()
        opponentCharacters.removeAll()
        
        Setting().presentation()
    }
}

