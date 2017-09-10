//
//  ViewController.swift
//  BullEye
//
//  Created by Carlos Lee on 2017-09-06.
//  Copyright © 2017 Carlos Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    @IBOutlet weak var scoreLabel : UILabel!
    @IBOutlet weak var roundLabel : UILabel!
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        round += 1
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points
        
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" +
            "\nThe difference is: \(difference)"
        
        let alert = UIAlertController(title: "Hello, Word", message:message, preferredStyle: .alert)
        
        let action = UIAlertAction(title:"Awesome", style: .default, handler: {action in self.startNewRound(); self.updateLabels()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)

    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }

}

