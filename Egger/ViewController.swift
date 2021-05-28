//
//  ViewController.swift
//  Egger
//
//  Created by Daniel Caccia on 15/01/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalSeconds = 0
    var secondsPassed = 0
    let eggTimes = [
        "A La Coq" : 180,
        "Barzotto" : 5,
        "Medium" : 420,
        "Hard" : 720
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func eggSelected(_ sender: UIButton) {
        let eggType = sender.currentTitle!
        
        timer.invalidate()
        totalSeconds = eggTimes[eggType]!
        secondsPassed = 0
        
        progressBar.progress = 0
        titleLabel.text = "Boiling a \"\(eggType)\" egg..."

        timer = Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(updateTimer),
                             userInfo: nil,
                             repeats: true)
    }    

    @objc func updateTimer() {
        if secondsPassed < totalSeconds {
            progressBar.progress = Float(secondsPassed) / Float(totalSeconds)
            secondsPassed += 1
        } else {
            let url = Bundle.main.url(forResource: "alarm", withExtension: "wav")
            
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            progressBar.progress = 1
            timer.invalidate()
            titleLabel.text = "Grab your egg!"
        }
    }
    
}
