//
//  ViewController.swift
//  lifecounter
//
//  Created by Adele on 1/24/19.
//  Copyright © 2019 edu.washington. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var OutcomeLabel: UILabel!
    @IBOutlet weak var PlayerOneScore: UILabel!
    @IBOutlet weak var PlayerTwoScore: UILabel!
    @IBOutlet weak var PlayerThreeScore: UILabel!
    @IBOutlet weak var PlayerFourScore: UILabel!
    var losers : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func PlayerOne_PlusFive(_ sender: Any) {
        PlayerOneScore.text = newScore(PlayerOneScore.text, 5, "1")
    }
    @IBAction func PlayerOne_MinusFive(_ sender: Any) {
        PlayerOneScore.text = newScore(PlayerOneScore.text, -5, "1")
    }
    @IBAction func PlayerOne_PlusOne(_ sender: Any) {
        PlayerOneScore.text = newScore(PlayerOneScore.text, 1, "1")
    }
    @IBAction func PlayerOne_MinusOne(_ sender: Any) {
        PlayerOneScore.text = newScore(PlayerOneScore.text, -1, "1")
    }
    
    
    @IBAction func PlayerTwo_MinusOne(_ sender: Any) {
        PlayerTwoScore.text = newScore(PlayerTwoScore.text, -1, "2")
    }
    @IBAction func PlayerTwo_PlusOne(_ sender: Any) {
        PlayerTwoScore.text = newScore(PlayerTwoScore.text, 1, "2")
    }
    @IBAction func PlayerTwo_MinusFive(_ sender: Any) {
        PlayerTwoScore.text = newScore(PlayerTwoScore.text, -5, "2")
    }
    
    @IBAction func PlayerTwo_PlusFive(_ sender: Any) {
        PlayerTwoScore.text = newScore(PlayerTwoScore.text, 5, "2")
    }
    
    
    @IBAction func PlayerThree_MinusOne(_ sender: Any) {
        PlayerThreeScore.text = newScore(PlayerThreeScore.text, -1, "3")
    }
    
    @IBAction func PlayerThree_PlusOne(_ sender: Any) {
        PlayerThreeScore.text = newScore(PlayerThreeScore.text, 1, "3")
    }
    
    @IBAction func PlayerThree_MinusFive(_ sender: Any) {
        PlayerThreeScore.text = newScore(PlayerThreeScore.text, -5, "3")
    }
    @IBAction func PlayerThree_PlusFive(_ sender: Any) {
        PlayerThreeScore.text = newScore(PlayerThreeScore.text, 5, "3")
    }
    
    @IBAction func PlayerFour_MinusOne(_ sender: Any) {
        PlayerFourScore.text = newScore(PlayerFourScore.text, -1, "4")
        
    }
    @IBAction func PlayerFour_PlusOne(_ sender: Any) {
        PlayerFourScore.text = newScore(PlayerFourScore.text, 1, "4")
    }
    @IBAction func PlayerFour_MinusFive(_ sender: Any) {
        PlayerFourScore.text = newScore(PlayerFourScore.text, -5, "4")
    }
    
    @IBAction func PlayerFour_PlusFive(_ sender: Any) {
        PlayerFourScore.text = newScore(PlayerFourScore.text, 5, "4")
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

