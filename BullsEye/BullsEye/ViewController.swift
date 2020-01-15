//
//  ViewController.swift
//  BullsEye
//
//  Created by Tyler Nguyen on 3/2/19.
//  Copyright © 2019 Tyler Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0  // currentValue holds value of slider
    var targetValue = 0   // targetValue stores value that we want user to guess
    var score = 0   // total score of user
    var roundCount = 0  // tracks number of rounds
    
    @IBOutlet weak var slider: UISlider!  // outlet for slider
    @IBOutlet weak var targetLabel: UILabel!  // outlet to display targetValue
    @IBOutlet weak var scoreLabel: UILabel!  // outlet to display total score
    @IBOutlet weak var roundLabel: UILabel!  // outlet to display rounds
    
    override func viewDidLoad() {  // what the view controller initially sees
        super.viewDidLoad()
        
        let roundedValue = slider.value.rounded()   // initialize slider value
        currentValue = Int(roundedValue)
        
        startNewGame() // call startNewGame when program starts
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showAlert(){  // when user taps hit me button
        
        let difference = abs(currentValue - targetValue) // compute difference between currentValue and target
        var points = 100 - difference   // compute score
        
        let title: String  // output title
        if difference == 0{
            title = "Perfect!"
            points += 100  // give 100 bonus points
        }
        else if difference < 5{
            title = "You almost had it!"
            if difference == 1{
                points += 51  // give 50 bonus points if 1 off
            }
        }
        else if difference < 10{
            title = "Pretty good!"
        }
        else{
            title = "Not even close..."
        }
        
        score += points  // add to user's score
        
        let message = "You scored \(points) points!"  // output message

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound() // start new round when OK button is tapped
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){   // starts a new round when this function is called
        targetValue = Int.random(in: 1...100)   // randomize targetValue
        currentValue = 50     // reset curentValue
        slider.value = Float(currentValue)
        roundCount += 1 //increment roundCount by 1
        updateLabels()  // update labels
    }
    
    func updateLabels(){  // update labels when function is called
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(roundCount)
    }
    
    @IBAction func startNewGame(){  // start new game when game over button is tapped
        score = 0
        roundCount = 0
        startNewRound()
    }
}

