//
//  UpdateButtonsViewController.swift
//  lifecounter
//
//  Created by Adele on 1/30/19.
//  Copyright © 2019 edu.washington. All rights reserved.
//

import UIKit

class UpdateButtonsViewController: UIViewController {
    
    var gameButtonValues : [[Int]] = [[-1, 1, -5, 5], [-1, 1, -5, 5],
                            [-1, 1, -5, 5], [-1, 1, -5, 5],
                            [-1, 1, -5, 5], [-1, 1, -5, 5],
                            [-1, 1, -5, 5], [-1, 1, -5, 5],
                            [-1, 1, -5, 5], [-1, 1, -5, 5]]
    
    @IBOutlet var PlayerButtonValues: [UILabel]!
    
    @IBOutlet var StackViews: [UIStackView]!
    
    var activePlayerCount : Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set values
        for (index, button) in PlayerButtonValues.enumerated() {
            button.text = String(gameButtonValues[index][3])
        }
        
        for (index, view) in StackViews.enumerated() {
            if index <= activePlayerCount {
                view.isHidden = false
            } else {
                view.isHidden = true
            }
        }
    }
    
    @IBAction func PlusButtonPress(_ sender: UIButton) {
        let playerNumber : Int = sender.tag - 1
        gameButtonValues[playerNumber][3] += 1
        gameButtonValues[playerNumber][2] = -gameButtonValues[playerNumber][3]
        PlayerButtonValues[playerNumber].text
            = String(gameButtonValues[playerNumber][3])
    }
    
    @IBAction func MinusButtonPress(_ sender: UIButton) {
        let playerNumber : Int = sender.tag - 1
        gameButtonValues[playerNumber][3] -= 1
        gameButtonValues[playerNumber][2] = -gameButtonValues[playerNumber][3]
        PlayerButtonValues[playerNumber].text
 = String(gameButtonValues[playerNumber][3])
        
    }
}
