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
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel : UILabel!
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
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
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello, Word", message:message, preferredStyle: .alert)
        
        let action = UIAlertAction(title:"Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }

}

