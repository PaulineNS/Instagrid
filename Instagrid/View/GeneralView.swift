//
//  GeneralView.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 11/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class GeneralView: UIView {

    @IBOutlet weak var gridLocation: UIView!
    @IBOutlet weak var diplayFirstGrid: UIImageView!
    @IBOutlet weak var displaySecondGrid: UIImageView!
    @IBOutlet weak var displayThirdGrid: UIImageView!
    
    enum Style {
        case firstGrid, secondGrid, thirdGrid
    }
    
    var style: Style = .firstGrid {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .firstGrid:
            break
        case .secondGrid:
            break
        case .thirdGrid:
            break
        }
    }

}
