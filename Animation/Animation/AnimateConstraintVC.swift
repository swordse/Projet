//
//  AnimateConstraintVC.swift
//  Animation
//
//  Created by Raphaël Goupille on 03/06/2021.
//

import UIKit

class AnimateConstraintVC: UIViewController {

    @IBOutlet weak var topStack: UIStackView!
    
    @IBOutlet weak var middleStack: UIStackView!
    
    @IBOutlet weak var bottomStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomStack.isHidden = true
        bottomStack.alpha = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func layoutButtons(_ sender: UIButton) {
        let selectedButton = sender.tag
        
        switch selectedButton {
        case 1:
            UIView.animate(withDuration: 0.33) {
                self.bottomStack.isHidden = false
                self.bottomStack.alpha = 1
                self.topStack.isHidden = true
                self.topStack.alpha = 0
                self.middleStack.isHidden = false
                self.middleStack.alpha = 1
            }
            
        case 2:
            UIView.animate(withDuration: 0.33) {
                self.bottomStack.isHidden = true
                self.bottomStack.alpha = 0
                self.topStack.isHidden = false
                self.topStack.alpha = 1
                self.middleStack.isHidden = false
                self.middleStack.alpha = 1
            }
            
        case 3:
            UIView.animate(withDuration: 0.3) {
                sender.isSelected = true
                self.bottomStack.isHidden = false
                self.bottomStack.alpha = 1
                self.topStack.isHidden = false
                self.topStack.alpha = 1
                self.middleStack.isHidden = true
                self.middleStack.alpha = 0
            }
            
        default:
            return
        
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
