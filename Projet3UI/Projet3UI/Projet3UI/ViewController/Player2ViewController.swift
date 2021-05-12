//
//  Player2ViewController.swift
//  Projet3UI
//
//  Created by Raphaël Goupille on 08/05/2021.
//

import UIKit

class Player2ViewController: UIViewController {


    @IBOutlet weak var dwarfTextField: UITextField!
    
    @IBOutlet weak var mageTextField: UITextField!
    
    @IBOutlet weak var soldierTextField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    var game = Game()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let dwarfName = dwarfTextField.text ?? ""
            let mageName = mageTextField.text ?? ""
            let soldierName = soldierTextField.text ?? ""
        
        game.createCharacter(dwarfName: dwarfName, mageName: mageName, soldierName: soldierName, playerOneIsPlaying: Game.playerOneIsPlaying)
        
        for character in Teams.teamOne {
            print("TeamOne \(character.name)")
        }
        
        for character in Teams.teamTwo {
            print("TeamOne \(character.name)")
    }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
