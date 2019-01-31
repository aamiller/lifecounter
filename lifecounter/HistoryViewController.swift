//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Adele on 1/30/19.
//  Copyright © 2019 edu.washington. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    var gameHistoryText : String = ""
    @IBOutlet weak var GameHistory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        GameHistory.text = gameHistoryText
    }
    
}
