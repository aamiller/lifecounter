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
    
    @IBOutlet var Add_Remove_Player_Buttons: [UIButton]!
    
    // Button press values for all players
    var increment_vals : [[Int]] = [[-1, 1, -5, 5], [-1, 1, -5, 5],
                                    [-1, 1, -5, 5], [-1, 1, -5, 5],
                                    [-1, 1, -5, 5], [-1, 1, -5, 5],
                                    [-1, 1, -5, 5], [-1, 1, -5, 5],
                                    [-1, 1, -5, 5], [-1, 1, -5, 5]]
    
    var losers: [String] = []
    
    var gameHistory: String = "Game begins. \n"
    
    var player_count = 4
    
    var gameStarted : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func unwindToThisVC(_ sender: UIStoryboardSegue) {
        if let senderVC = sender.source as? UpdateButtonsViewController {
            increment_vals = senderVC.gameButtonValues
        }
        
        // Update text values in displayed buttons
        PlayerOneButtons[2].setTitle(String(increment_vals[0][2]), for: .normal)
        PlayerOneButtons[3].setTitle(String(increment_vals[0][3]), for: .normal)
        
        PlayerTwoButtons[2].setTitle(String(increment_vals[1][2]), for: .normal)
        PlayerTwoButtons[3].setTitle(String(increment_vals[1][3]), for: .normal)
        
        PlayerThreeButtons[2].setTitle(String(increment_vals[2][2]), for: .normal)
        PlayerThreeButtons[3].setTitle(String(increment_vals[2][3]), for: .normal)
        
        PlayerFourButtons[2].setTitle(String(increment_vals[3][2]), for: .normal)
        PlayerFourButtons[3].setTitle(String(increment_vals[3][3]), for: .normal)
        
        PlayerFiveButtons[2].setTitle(String(increment_vals[4][2]), for: .normal)
        PlayerFiveButtons[3].setTitle(String(increment_vals[4][3]), for: .normal)
        
        PlayerSixButtons[2].setTitle(String(increment_vals[5][2]), for: .normal)
        PlayerSixButtons[3].setTitle(String(increment_vals[5][3]), for: .normal)
        
        PlayerSevenButtons[2].setTitle(String(increment_vals[6][2]), for: .normal)
        PlayerSevenButtons[3].setTitle(String(increment_vals[6][3]), for: .normal)
        
        PlayerEightButtons[2].setTitle(String(increment_vals[7][2]), for: .normal)
        PlayerEightButtons[3].setTitle(String(increment_vals[7][3]), for: .normal)
    }
    
    @IBAction func UpdatePlayersButtonPress(_ sender: UIButton) {
        if !gameStarted {
            switch sender.tag {
            case 1: // Remove player
                if player_count > 2 {
                    PlayerStackViews[player_count - 1].isHidden = true
                    player_count -= 1
                }
            case 2: // Add player
                if player_count < 8 {
                    PlayerStackViews[player_count].isHidden = false
                    player_count += 1
                }
            default: break
            }
        }
    }
    
    @IBAction func ChangeValueButtonPressed(_ sender: UIButton) {
        gameStarted = true
        Add_Remove_Player_Buttons[0].isEnabled = false
        Add_Remove_Player_Buttons[1].isEnabled = false
        
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
        let newScore = Int(currScore)! + increment_vals[Int(player)! - 1][scoreChangeTag - 1]
        let playerDetails : String = "Player " + player
        switch scoreChangeTag {
        case 1: gameHistory = gameHistory + playerDetails + " lost 1 life.\n"
        case 2: gameHistory = gameHistory + "Player " + player + " gained 1 life.\n"
        case 3:
            let scoreChange : Int = abs(increment_vals[Int(player)! - 1][scoreChangeTag - 1])
            gameHistory = gameHistory + String(playerDetails) + " lost "  + String(scoreChange) + " life. \n"
        case 4:
            let scoreChange : Int = increment_vals[Int(player)! - 1][scoreChangeTag - 1]
            gameHistory = gameHistory + String(playerDetails) + " gained " + String(scoreChange) + " life. \n"
        default: break
        }
        
        if newScore <= 0 {
            if !losers.contains(player) {
                losers.append(player)
                gameHistory = gameHistory + "Player " + player + " lost. \n\n"
            }
        }
        return String(newScore)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // verify that this is the right segue or going to the right view controller destination
        switch segue.identifier {
        case "GameToHistorySegue":
            let historyVC = segue.destination as! HistoryViewController
            historyVC.gameHistoryText = gameHistory
        case "UpdateButtonSegue":
            let buttonUpdate = segue.destination as! UpdateButtonsViewController
            buttonUpdate.gameButtonValues = increment_vals
        default: break
        }
    }
}

