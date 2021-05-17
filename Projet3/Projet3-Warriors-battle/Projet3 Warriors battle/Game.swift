
import Foundation

class Game {
    
    var numberOfTeams = 2
    var teamCreator = TeamCreator()
    var teams = [Team]()
    var turn = 0
    // calculate the opponentIndex based on the current turn
    var opponentTeamIndex: Int {
        if turn % 2 == 0 {
            return 1
        } else {
            return 0
        }
    }
    
    func start() {
        print(Constants.presentation)
        teamCreator.createTeam()
        teams = teamCreator.teams
        fight()
    }
    
    func fight() {
        while true {
            for i in 0 ..< numberOfTeams {
                
                // get the fighter
                print(Constants.separator + "\n")
                print(teams[i].name.uppercased() + ": \(Constants.chooseFighter)")
                let playerChoice = teams[i].teamChoice()
                let chosenFighter = teams[i].characters[playerChoice]
                // if the fighter is a mage, he can heal or attack
                if let mage = chosenFighter as? Mage {
                    if mage.mageChoiceHeal() {
                        // mage has chosen to heal
                        print(Constants.chooseCharacterToHeal)
                        let playerChoice = teams[i].teamChoice()
                        let teammateToHeal = teams[i].characters[playerChoice]
                        mage.heal(teammateToHeal: teammateToHeal)
                    } else  {
                        // mage has chosen to attack: get the opponent
                        print(Constants.chooseOpponent)
                        let playerChoice = teams[opponentTeamIndex].teamChoice()
                        let opponentCharacter = teams[opponentTeamIndex].characters[playerChoice]
                        mage.attack(against: opponentCharacter)
                        removeDeadCharacter(opponentCharacter: opponentCharacter, teamIndex: opponentTeamIndex, characterIndex: playerChoice)
                        if checkWin() {
                            return
                        }
                    }
                } else {
                    // if the fighter is not a mage, get the opponent
                    print(Constants.chooseOpponent)
                    let playerChoice = teams[opponentTeamIndex].teamChoice()
                    let opponentCharacter = teams[opponentTeamIndex].characters[playerChoice]
                    chosenFighter.attack(against: opponentCharacter)
                    removeDeadCharacter(opponentCharacter: opponentCharacter, teamIndex: opponentTeamIndex, characterIndex: playerChoice)
                    if checkWin() {
                        return
                    }
                }
                turn += 1
            }
        }
    }
    
    func removeDeadCharacter(opponentCharacter: Character, teamIndex: Int, characterIndex: Int) {
        if opponentCharacter.isAlive == false {
            teams[teamIndex].characters.remove(at: characterIndex)
        }
    }
    
    func checkWin() -> Bool {
        var win = false
        if teams[0].characters.isEmpty {
            print(teams[1].name.uppercased() + " WINS!!!!!!!" )
            win = true
            displayStats(team: teams[1])
        }
        if teams[1].characters.isEmpty {
            print("\n" + Constants.separator)
            print(teams[0].name.uppercased() + " WINS!!!!!!! \n CONGRATULATIONS" )
            print("\n" + Constants.separator)
            win = true
            displayStats(team: teams[0])
        }
        return win
    }
    
    // display the stats of the game
    func displayStats(team: Team) {
        print("You have killed all the other team's characters in: \(turn) turns."
                + "\nAfter this fight, here is your team state:")
        for character in team.characters {
            print("Name: \(character.name) - type: \(character.kind) - life: \(character.health) - weapon: \(character.weapon) ")
            print("\n" + Constants.separator)
        }
        resetGame()
    }
    
    func resetGame() {
        turn = 0
        print("Do you want to play again?"
                + "\n1. Yes"
                + "\n2. No")
        
        if let choice = readLine() {
            if let intChoice = Int(choice) {
                switch intChoice {
                case 1:
                    start()
                case 2:
                    print("Goodbye")
                default:
                    print("You must choose 1 or 2.")
                }
            }
        }
    }
    
}



