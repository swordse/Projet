//
//  StartViewController.swift
//  Projet3UI
//
//  Created by Raphaël Goupille on 08/05/2021.
//

import UIKit

class StartViewController: UIViewController {

    

    @IBOutlet weak var startText: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        startText.text = "WELCOME TO WARRIORS FIGHTERS !!!! \n \n \n In this game you will fight against another team. \n Try not to dead. "
        
    }
    
    
    @IBAction func startButton(_ sender: Any) {
    }
    //    let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.text = "Welcome to WARRIORS FIGHTERS !!! In this game you will \n fight against another team. Try not to dead. sssxsxsxsxsxsxsxsxsxssxsxsxsxsxsxsxsxsxsx "
//        view.addSubview(label)
//
//        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50), label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20), label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500)])
//
//        label.text = "Welcome to WARRIORS FIGHTERS !!! \nIn this game you will fight against another team. \n Try not to dead. "
        
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


