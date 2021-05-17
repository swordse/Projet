//
//  Team.swift
//  Projet3 Warriors battle
//
//  Created by Raphaël Goupille on 10/05/2021.
//

import Foundation

class Team {

    var name: String
    var characters = [Character]()
    
    
    init(name: String) {
        self.name = name
    }
    // func to obtain the player's choice among characters
    func teamChoice() -> Int {
        var playerChoice = 0
        var number = 1
        var numbers: [Int] = []
        for character in characters {
            if character.isAlive {
                print("\(number). \(character.kind.rawValue.uppercased()): \(character.name)")
                number += 1
                numbers.append(number - 1)
            }
        }
        repeat {
        if let choice = readLine() {
            if let intChoice = Int(choice) {
                if numbers.contains(intChoice){
                    playerChoice = intChoice
                } else {
                    print("Choose an available number:")
                }
            }
        }
        } while numbers.contains(playerChoice) == false
        return playerChoice - 1
    }
    
}

