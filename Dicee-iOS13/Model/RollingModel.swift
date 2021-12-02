import Foundation
import UIKit

class RollingModel {
    
    var timer = Timer()
    
    let dice1: UIImageView?
    let dice2: UIImageView?
    let diceFaces: [UIImage]
    
    init(d1: UIImageView, d2: UIImageView, faces: [UIImage]) {
        dice1 = d1
        dice2 = d2
        diceFaces = faces
    }
    
    @objc func stopRollingAnimation() {
        dice1?.stopAnimating()
        dice2?.stopAnimating()
    }
    
    func roll() {
        timer.invalidate()
        
        dice1?.animationImages = diceFaces.shuffled()
        dice2?.animationImages = diceFaces.shuffled()
        dice1?.animationDuration = 1.0
        dice2?.animationDuration = 0.2
        
        dice1?.startAnimating()
        dice2?.startAnimating()
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector((stopRollingAnimation)), userInfo: nil, repeats: false)
    }
}
