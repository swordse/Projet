//
//  ViewController.swift
//  Animation
//
//  Created by Raphaël Goupille on 26/05/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    var visibleConstraint: NSLayoutConstraint?
    var invisibleConstraint: NSLayoutConstraint?
    
    @IBOutlet weak var viewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var testView: UIView!
        
    @IBOutlet weak var leftImage: UIImageView!
    
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var bottomImage: UIImageView!
    
    @IBOutlet weak var leftBottom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        visibleConstraint = testView.heightAnchor.constraint(equalToConstant: 240)
        invisibleConstraint = testView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    @IBAction func leftButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
    
    

    @IBAction func swipe(_ sender: Any) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return
        }
        leftImage.image = image
        leftBottom.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func animateButton(_ sender: Any) {
    
        viewHeightConstraint.constant = 0
        
        UIView.animate(withDuration: 0.33) {
            self.view.layoutIfNeeded()
        }
        
        
        // déplacement des boutons
//        UIView.animate(withDuration: 0.3) {
//
//            self.leftImage.frame = CGRect(x: 0, y: 0, width: 240, height: 100)
//        }
//
//        UIView.animate(withDuration: 0.3) {
//            self.bottomImage.frame = CGRect(x: 0, y: 140, width: 100, height: 100)
//        }
//
//        UIView.animate(withDuration: 0.3) {
//            self.rightImage.frame = CGRect(x: 140, y: 140, width: 100, height: 100)
//        }
        
        
    }
    
}

