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
    
    func newScore(_ oldScore: String?, _ scoreChange: Int, _ player: String) -> String {
        let currScore : String = PlayerOneScore.text ?? "0"
        let newScore = Int(currScore)! + scoreChange
        if newScore <= 0 {
            if !losers.contains(player) {
                losers.append(player)
                OutcomeLabel.text = OutcomeLabel.text! +  " Player " + player + " LOSES!"
            }
        }
        return String(newScore)
    }
}

