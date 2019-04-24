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

    // Outlets
    @IBOutlet weak var swipeSymbol: UIImageView!
    @IBOutlet weak var swipeLabel: UILabel!
    
    //Swipe according to the orientation of the screen
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isPortrait && sender.direction == .up {
            delegate?.onSwipeSymbol()
        }
    }
    
    //Swipe according to the orientation of the screen
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape && sender.direction == .left {
            delegate?.onSwipeSymbol()
        }
    }

    // Changing the display sentance according to orientation of screen
    func swipeOrientation() {
        if UIDevice.current.orientation.isLandscape {
            swipeLabel.text = "Swipe left to share"
        } else if UIDevice.current.orientation.isPortrait {
            swipeLabel.text = "Swipe up to share"
        }
    }
}
