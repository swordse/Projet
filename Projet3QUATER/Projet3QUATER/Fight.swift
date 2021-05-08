//
//  Fight.swift
//  Projet3 commandLine
//
//  Created by Raphaël Goupille on 04/05/2021.
//

import Foundation

class Fight: Game {
    
    
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
    
    
    var numberOfTurn: Int = 1
    
    var magicBox = false

    
    func fight() {
        
        // check which player is playing and assign the corresponding characters
        if Game.playerOneIsPlaying {
            fightingCharacters = Team.teamOne
            opponentCharacters = Team.teamTwo
        } else {
            fightingCharacters = Team.teamTwo
            opponentCharacters = Team.teamOne
        }
        
        // Player choose his fighter
        Setting.spacer()
        print("Turn: \(numberOfTurn). \(Game.playerOneIsPlaying ? "Player ONE:" : "Player TWO:") choose your fighter for this round:"
        + "\n")
        showCharactersChoice(characters: fightingCharacters)
        fighterIndex = readIndex(characters: fightingCharacters)
        magicBox = MagicBox().findBox()
        
        if magicBox {
            print("\n"
                    + "------   You have found a MAGIC BOX which contains a \(fighter.magicWeapon). It can damage \(fighter.magicWeapon.rawValue) points.   ------"
            + "\n")
        }
        // if fighter is a mage : choose the teamate to heal
        if fighter.kind == .mage {
            Setting.spacer()
            print("Turn: \(numberOfTurn). \(Game.playerOneIsPlaying ? "Player One:" : "Player Two:") choose the character of your team you want to heal:"
                    + "\n")
            showCharactersChoice(characters: fightingCharacters)
            characterToHealIndex = readIndex(characters: fightingCharacters)
            fightResult()
        } else {
            // if fighter is not a mage: choose the opponent character
            Setting.spacer()
            print("Turn: \(numberOfTurn).  \(Game.playerOneIsPlaying ? "Player One" : "Player Two:") choose your opponnent :"
                + "\n")
            showCharactersChoice(characters: opponentCharacters)
            opponentIndex = readIndex(characters: opponentCharacters)
            fightResult()
        }
        
    }
    // show the fighter or opponent characters
    func showCharactersChoice(characters: [Character])  {
        var number = 1
        for character in characters {
            if character.isAlive == true {
                print("\(number). \(character.name) - life: \(character.health) - weapon: \(character.weapon) - damage: \(character.weapon.rawValue)")
                number += 1
            }
        }
    }
    // read the index of the choosen character
    func readIndex(characters: [Character]) -> Int {
        let maxNumber = characters.count
        var index = Int()
        if let choice = readLine() {
            if let intChoice = Int(choice) {
                if intChoice > maxNumber || intChoice <= 0 {
                    print("This choice is impossible. Choose again:")
                    readIndex(characters: characters)
                } else {
                    index = intChoice - 1
                }
            
//            switch intChoice {
//            case 1:
//                index = 0
//            case 2:
//                index = 1
//            case 3:
//                index = 2
//            default:
//                print("YOU MUST CHOOSE A NUMBER BETWEEN 1 OR 3.")
//                readIndex(characters: characters)
//            }
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
        Game.playerOneIsPlaying ? Team.teamTwo.remove(at: opponentIndex) : Team.teamOne.remove(at: opponentIndex)
    }
        Game.playerOneIsPlaying.toggle()
        numberOfTurn += 1
        checkWin()
    }
    
    // check if a player has won ie. if all characters of a team are dead
    func checkWin() {
        if Team.teamOne.isEmpty {
            Setting.line()
            Setting.line()
            print("\n"
                    + "\n-------   \(Team.teamTwoName.uppercased()) WINS !!!!   -------"
                    + "\n-------   CONGRATULATIONS   -------")
            Setting.line()
            Setting.line()
            displayStats(team: Team.teamTwo)
        }
        if Team.teamTwo.isEmpty {
            Setting.line()
            Setting.line()
            print("\n"
                  + "\n-------   \(Team.teamOneName.uppercased()) WINS !!!!   -------"
                    + "\n-------   CONGRATULATIONS   -------")
            Setting.line()
            Setting.line()
            displayStats(team: Team.teamOne)
        }
        else {
            fight()
        }
    }
    // display the stats of the game
    func displayStats(team: [Character]) {
        Setting.spacer()
        Setting.spacer()
        print("You have killed all the other team's characters in: \(numberOfTurn - 1) turns."
                + "\nAfter this fight, here is your team state:")
        for character in team {
            print("Name: \(character.name) - type: \(character.kind) - life: \(character.health) - weapon: \(character.weapon) ")
        }
        Setting.spacer()
        Setting.spacer()
        
        resetGame()
    }
    
    func resetGame() {
        Game.playerOneIsPlaying = true
        
        // array of all characters by team
        Team.teamOne.removeAll()
        Team.teamTwo.removeAll()
        
        // array of characters which will be affected to teamOne or teamTwo depending of the state of the game
        fightingCharacters.removeAll()
        opponentCharacters.removeAll()
        
        print("Do you want to play again?"
        + "\n1. Yes"
        + "\n2. No")
        
        if let choice = readLine() {
            if let intChoice = Int(choice) {
                switch intChoice {
                case 1:
                    Setting().presentation()
                case 2:
                   break
                default:
                    print("You must choose 1 or 2.")
                }
        }
        }
        
    }
}

