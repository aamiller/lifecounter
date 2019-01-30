//
//  ViewController.swift
//  lifecounter
//
//  Created by Adele on 1/24/19.
//  Copyright © 2019 edu.washington. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var PlayerScore: [UILabel]!
    
    @IBOutlet var PlayerOneButtons: [UIButton]!
   
    @IBOutlet var PlayerTwoButtons: [UIButton]!
    
    @IBOutlet var PlayerThreeButtons: [UIButton]!
    
    @IBOutlet var PlayerFourButtons: [UIButton]!
    
    @IBOutlet var PlayerFiveButtons: [UIButton]!
    
    @IBOutlet var PlayerSixButtons: [UIButton]!
    
    @IBOutlet var PlayerSevenButtons: [UIButton]!
    
    @IBOutlet var PlayerEightButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func newScore(_ oldScore: String?, _ scoreChange: Int, _ player: String) -> String {
        let currScore : String = oldScore ?? "0"
        let newScore = Int(currScore)! + scoreChange
        if newScore <= 0 {
            if !losers.contains(player) {
                losers.append(player)
                OutcomeLabel.text = OutcomeLabel.text! +  " Player " + player + " LOSES!"
                if losers.count == 2 {
                    OutcomeLabel.text = OutcomeLabel.text! + "\n"
                }
            }
        }
        return String(newScore)
    }
}

