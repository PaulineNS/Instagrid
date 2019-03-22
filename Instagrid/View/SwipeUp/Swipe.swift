//
//  SwipUp.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 22/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class Swipe: UIView {

    @IBOutlet weak var swipeSymbol: UIImageView!
    @IBOutlet weak var swipeLabel: UILabel!
    
    var delegate: SwipeDelegate?
    
    func swipeOrientation() {
        if UIDevice.current.orientation.isLandscape {
            swipeLabel.text = "Swipe left to share"
            swipeSymbol.transform = CGAffineTransform(rotationAngle: .pi * 1.5)
        } else if UIDevice.current.orientation.isPortrait {
            swipeLabel.text = "Swipe up to share"
        }
    }
    
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape && sender.direction == .left {
            delegate?.onSwipeSymbol()
        } else {
            return
        }
    }
    
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape && sender.direction == .left {
            delegate?.onSwipeSymbol()
        } else {
            return
        }
    }
    
}
