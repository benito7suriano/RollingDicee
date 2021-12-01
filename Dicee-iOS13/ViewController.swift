//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    let diceFaces = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollButton.layer.cornerRadius = 60 / 4
        
    }

    @objc func stopRollingAnimation() {
        diceImageView1.stopAnimating()
        diceImageView2.stopAnimating()
    }
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        
        timer.invalidate()
        
        diceImageView1.animationImages = diceFaces.shuffled()
        diceImageView2.animationImages = diceFaces.shuffled()
        diceImageView1.animationDuration = 1.0
        diceImageView2.animationDuration = 0.2
        
        diceImageView1.startAnimating()
        diceImageView2.startAnimating()
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector((stopRollingAnimation)), userInfo: nil, repeats: false)
        
        diceImageView1.image = diceFaces.randomElement()
        diceImageView2.image = diceFaces.randomElement()

    }
    
}

