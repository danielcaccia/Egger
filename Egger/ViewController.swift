//
//  ViewController.swift
//  Egger
//
//  Created by Daniel Caccia on 15/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var secondsRemaining = 60
    let eggTimes = [
        "A La Coq" : 5,
        "Barzotto" : 300,
        "Medium" : 420,
        "Hard" : 2
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func eggPressed(_ sender: UIButton) {
        let eggType = sender.currentTitle!
        
        secondsRemaining = eggTimes[eggType]!
        
        Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(updateTimer),
                             userInfo: nil,
                             repeats: true)
    }
    

    @objc func updateTimer() {
        if secondsRemaining > 0 {
            secondsRemaining -= 1
        } else {
            titleLabel.text = "Grab your egg!"
        }
    }
    
}

