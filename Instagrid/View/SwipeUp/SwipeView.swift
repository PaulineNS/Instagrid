//
//  SwipUp.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 22/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class SwipeView: UIView {
    
    var delegate: SwipeDelegate?

    @IBOutlet weak var swipeSymbol: UIImageView!
    
    @IBOutlet weak var swipeLabel: UILabel!
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isPortrait && sender.direction == .up {
            delegate?.onSwipeSymbol()
        }
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape && sender.direction == .left {
            delegate?.onSwipeSymbol()
        }
    }

    func swipeOrientation() {
        if UIDevice.current.orientation.isLandscape {
            swipeLabel.text = "Swipe left to share"
        } else if UIDevice.current.orientation.isPortrait {
            swipeLabel.text = "Swipe up to share"
        }
    }
}
