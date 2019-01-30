//
//  ViewController.swift
//  lifecounter
//
//  Created by Adele on 1/24/19.
//  Copyright © 2019 edu.washington. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var PlayerStackViews: [UIStackView]!
    
    @IBOutlet var PlayerScore: [UILabel]!
    
    @IBOutlet var PlayerOneButtons: [UIButton]!
   
    @IBOutlet var PlayerTwoButtons: [UIButton]!
    
    @IBOutlet var PlayerThreeButtons: [UIButton]!
    
    @IBOutlet var PlayerFourButtons: [UIButton]!
    
    @IBOutlet var PlayerFiveButtons: [UIButton]!
    
    @IBOutlet var PlayerSixButtons: [UIButton]!
    
    @IBOutlet var PlayerSevenButtons: [UIButton]!
    
    @IBOutlet var PlayerEightButtons: [UIButton]!
    
    var increment_vals = [-1, 1, -5, 5]
    
    var losers: [String] = []
    
    var player_count = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func AddPlayerButtonPress(_ sender: Any) {
        if player_count < 8 {
            PlayerStackViews[player_count].isHidden = false
            player_count += 1
        }
    }
    
    @IBAction func ChangeValueButtonPressed(_ sender: UIButton) {
        
        if PlayerOneButtons.contains(sender) {
            PlayerScore[0].text = newScore(PlayerScore[0].text, sender.tag, "1")
        } else if PlayerTwoButtons.contains(sender) {
            PlayerScore[1].text = newScore(PlayerScore[1].text, sender.tag, "2")
        } else if PlayerThreeButtons.contains(sender) {
            PlayerScore[2].text = newScore(PlayerScore[2].text, sender.tag, "3")
        } else if PlayerFourButtons.contains(sender) {
            PlayerScore[3].text = newScore(PlayerScore[3].text, sender.tag, "4")
        } else if PlayerFiveButtons.contains(sender) {
            PlayerScore[4].text = newScore(PlayerScore[4].text, sender.tag, "5")
        } else if PlayerSixButtons.contains(sender) {
            PlayerScore[5].text = newScore(PlayerScore[5].text, sender.tag, "6")
        } else if PlayerSevenButtons.contains(sender) {
            PlayerScore[6].text = newScore(PlayerScore[6].text, sender.tag, "7")
        } else if PlayerEightButtons.contains(sender) {
            PlayerScore[7].text = newScore(PlayerScore[7].text, sender.tag, "8")
        }
    }
    


    func newScore(_ oldScore: String?, _ scoreChangeTag: Int, _ player: String) -> String {
        let currScore : String = oldScore ?? "0"
        let newScore = Int(currScore)! + increment_vals[scoreChangeTag - 1]
        
        if newScore <= 0 {
            if !losers.contains(player) {
                losers.append(player)
            }
        }
        return String(newScore)
    }
}

