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
    var roller: RollingModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rollButton.layer.cornerRadius = 60 / 4
        
        roller = RollingModel(d1: diceImageView1, d2: diceImageView2, faces: diceFaces)
        
    }

    @IBAction func rollButtonPressed(_ sender: Any) {
        
        roller?.roll()
        
        diceImageView1.image = diceFaces.randomElement()
        diceImageView2.image = diceFaces.randomElement()

    }
    
}

