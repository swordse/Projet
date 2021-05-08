//
//  Settings.swift
//  Projet3 commandLine
//
//  Created by Raphaël Goupille on 03/05/2021.
//

import Foundation

class Setting {
    
    //var teamOne: [Character] = []
    //var teamTwo: [Character] = []
    
    // MARK: GAME SETTINGS
    

    var names: [String] = []
    
    func presentation() {
        print("-------   WELCOME TO ⚔ WARRIOR FIGHT   -------"
                + "\n                                "
                + "\nIn this game, two teams of three characters face each other in a fight to the death."
                + "\nTo win, you have to kill all the opponent's characters"
                + "\n                                            ")
        startMenu()
    }
    
    func startMenu() {
        Setting.line()
        print("\n1. Start new game."
                + "\n2. See Characters and Rules.")
        Setting.line()
        
        if let choice = readLine() {
            switch choice {
            case "1":
                chooseTeamName()
            case "2":
                print("CHARACTERS:"
                        + "\n--------------------------------"
                      + "\nYour team is composed of three characters:"
                        + "\n1. A DWARF with an axe causing 10 points of damage and a life of 50 points"
                        + "\n2. A MAGE with a magic wand that can heal or cause 5 points of damage. His life is 50 points."
                        + "\n3. A SOLDIER with a sword causing 7 points of damage. His life is 70 points."
                        + "\n                                                          "
                        + "\nRULES"
                    + "\n--------------------------------"
                        + "\n Player One start playing by choising a character in his team to attack a character in the opponent team."
                        + "\n If the player choose the mage, he can heal one of his characters."
                    + "\n A magic chest can appear at random. This chest contains a more powerful weapon that the player can use."
                        + "\n After Player One turn, Player Two can play the same way."
                    + "\n The first player to kill all the opposing characters wins the game."
                )
                startMenu()
            default:
                print("YOU MUST ENTER 1 OR 2")
                startMenu()
            }
        }
    }
    
    func chooseTeamName() {
        Setting.line()
        Game.playerOneIsPlaying == true ? print("PLAYER ONE - Choose the name of team ONE:") : print("PLAYER TWO - Choose the name of team TWO:")
        let name = readAndCheckName()
        Game.playerOneIsPlaying == true ? (Team.teamOneName = name) : (Team.teamTwoName = name)
        chooseCharacterName()
    }
    
    func chooseCharacterName() {
        for character in ["dwarf", "mage", "soldier"] {
            Setting.spacer()
            print("Choose the name of your \(character):")
            let name = readAndCheckName()
            switch character {
            case "dwarf":
                let character = Dwarf(name: name)
                Game.playerOneIsPlaying == true ? Team.teamOne.append(character) : Team.teamTwo.append(character)
            case "mage":
                let character = Mage(name: name)
                Game.playerOneIsPlaying == true ? Team.teamOne.append(character) : Team.teamTwo.append(character)
            case "soldier":
                let character = Soldier(name: name)
                Game.playerOneIsPlaying == true ? Team.teamOne.append(character) : Team.teamTwo.append(character)
            default:
                break
            }
        }
        if Team.teamTwo.count == 0 {
            Game.playerOneIsPlaying.toggle()
            chooseTeamName()
        } else {
            Setting.line()
            print("      "
                    + "\nLET'S START FIGHTING !!!!!!"
                    + "\n            ")
            Setting.line()
            Game.playerOneIsPlaying.toggle()
            Fight().checkWin()
            
        }
    }
    
    func readAndCheckName() -> String {
        var characterName = ""
        repeat {
            if let name = readLine() {
                characterName = name
                if names.contains(characterName) {
                    print("This name is already used. Choose another one:")
                    characterName = ""
                } else {
                    names.append(name)
                }
            }
        } while characterName == ""
        return characterName
    }
    
    
    // MARK: VIEW SETTINGS
    
    static func spacer() {
        print("....................")
    }
    
    static func line() {
        print("--------------------------------------------------")
    }
    
}




