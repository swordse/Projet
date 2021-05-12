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
    
    func teamChoice() -> Int {
        var playerChoice = 0
        var number = 1
        var numbers = [1]
        for character in characters {
            if character.isAlive {
                print("\(number). \(character.kind.rawValue.uppercased()): \(character.name)")
                number += 1
                numbers.append(number)
            }
        }
        repeat {
        if let choice = readLine() {
            if let intChoice = Int(choice) {
                playerChoice = intChoice
            }
        }
        } while !numbers.contains(playerChoice)
        return playerChoice - 1
    }
    
}

