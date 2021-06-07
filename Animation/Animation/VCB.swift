//
//  VCB.swift
//  Animation
//
//  Created by Raphaël Goupille on 31/05/2021.
//

import UIKit

class VCB: UIViewController {

    
    
    @IBOutlet var buttonList: [UIButton]!
    
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    
    @IBOutlet weak var fullStack: UIStackView!
    
    @IBOutlet weak var toptopStack: UIStackView!
    
    @IBOutlet weak var topStack: UIStackView!
    
    @IBOutlet weak var buttomStack: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonList.forEach { button in
            button.isHidden = true
            button.alpha = 0
        }
        
        button1.hide()
        button2.hide()
        button5.hide()
        
        
        topStack.isHidden = true
        topStack.alpha = 0
        
        toptopStack.isHidden = true
        toptopStack.alpha = 0
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func actionButton(_ sender: Any) {
        buttonList.forEach { button in
            UIView.animate(withDuration: 0.8) {
                button.isHidden = !button.isHidden
                button.alpha = button.alpha == 0 ? 1 : 0
            }
        }
    }

    @IBAction func tappedButton(_ sender: Any) {
        UIView.animate(withDuration: 0.8) {
            self.button1.hide()
            self.button2.hide()
            self.button5.hide()
            
        }
    }
    
    
    @IBAction func buttonStack(_ sender: Any) {
        UIView.animate(withDuration: 0.8) {
            self.topStack.isHidden = !self.topStack.isHidden
            self.topStack.alpha = self.topStack.alpha == 0 ? 1 : 0
            
            self.buttomStack.isHidden = !self.buttomStack.isHidden
            self.buttomStack.alpha = self.buttomStack.alpha == 0 ? 1 : 0
        }
    }
    
    
    @IBAction func buttomButtonStack(_ sender: Any) {
        UIView.animate(withDuration: 0.8) {
            self.buttomStack.isHidden = !self.buttomStack.isHidden
            self.buttomStack.alpha = self.buttomStack.alpha == 0 ? 1 : 0
            
            self.toptopStack.isHidden = !self.toptopStack.isHidden
            self.toptopStack.alpha = self.toptopStack.alpha == 0 ? 1 : 0
        }
    }
    
    
}

extension UIButton {
    func hide(){
        self.isHidden = !self.isHidden
        self.alpha = self.alpha == 0 ? 1 : 0
    }
}
