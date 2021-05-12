
import Foundation

class Game {
    
    var numberOfTeams = 2
    var teamCreator = TeamCreator()
    var teams = [Team]()
    var turn = 0
    // caculate the opponentIndex based on the current turn
    var opponentIndex: Int {
        if turn % 2 == 0 {
            return 1
        } else {
            return 0
        }
    }
    
    func start() {
        teamCreator.createTeam()
        teams = teamCreator.teams
        fight()
    }
    
    //    func fighterChoice(index: Int) -> Int {
    //        var playerChoice = 0
    //        print(Constants.chooseFighter)
    //        teams[index].description()
    ////        var choosenFighter: Character
    //        repeat {
    //            if let choice = readLine() {
    //                if let intChoice = Int(choice) {
    //                    playerChoice = intChoice
    //                }
    //            }
    //        } while playerChoice > 0 && playerChoice < teams[index].characters.count && playerChoice != 3
    //        return playerChoice
    //    }
    
    //    func opponentChoice(opponentIndex: Int) -> Int {
    //        var playerChoice = 0
    //        print("Choose an opponent character to attack:")
    //        var number = 1
    //        for character in
    //        print("\(number). Opponent Dwarf: \(teams[opponentIndex].characters[0].name). \n2. Opponent Mage: \(teams[opponentIndex].characters[1].name). \n3. Opponent Soldier: \(teams[opponentIndex].characters[2].name)")
    //        repeat {
    //        if let choice = readLine() {
    //            if let intChoice = Int(choice) {
    //                playerChoice = intChoice
    //            }
    //        }
    //    } while playerChoice != 1 && playerChoice != 2 && playerChoice != 3
    //        return playerChoice
    //    }
    
    func fight() {
        while true {
            for i in 0 ..< numberOfTeams {
                // get the fighter
                print(Constants.chooseFighter)
                let playerChoice = teams[i].teamChoice()
                let choosenFighter = teams[i].characters[playerChoice]
                // A SIMPLIFIER
                print(choosenFighter)
                // if the fighter is a mage, he can heal or attack
                if let mage = choosenFighter as? Mage {
                    if mage.mageChoiceHeal() {
                        print(Constants.chooseCharacterToHeal)
                        let playerChoice = teams[i].teamChoice()
                        let teammateToHeal = teams[i].characters[playerChoice]
                        mage.heal(teammateToHeal: teammateToHeal)
                    } else  {
                        print(Constants.chooseOpponent)
                        let playerChoice = teams[opponentIndex].teamChoice()
                        let opponentCharacter = teams[opponentIndex].characters[playerChoice]
                        print(opponentCharacter)
                        print(opponentCharacter.health)
                        mage.attack(against: opponentCharacter)
                        print(opponentCharacter.health)
                    }
                } else {
                    // if the fighter is not a mage, get the opponent
                    print(Constants.chooseOpponent)
                    let playerChoice = teams[opponentIndex].teamChoice()
                    let opponentCharacter = teams[opponentIndex].characters[playerChoice]
                    
                    print(opponentCharacter)
                    print(opponentCharacter.health)
                    
                    choosenFighter.attack(against: opponentCharacter)
                    
                    print(opponentCharacter.health)
                    }
                }
            }
        }
    
//    func teammateChoice(index: Int) -> Int {
//        var playerChoice = 0
//        print("Choose one of your teammate to heal:")
//        print("1. Your Dwarf: \(teams[index].characters[0].name). \n2. Your Mage: \(teams[index].characters[1].name). \n3. Your Soldier: \(teams[index].characters[2].name)")
//        repeat {
//            if let choice = readLine() {
//                if let intChoice = Int(choice) {
//                    playerChoice = intChoice
//                }
//            }
//        } while playerChoice != 1 && playerChoice != 2 && playerChoice != 3
//        return playerChoice
//    }
//    
    
    
    }



