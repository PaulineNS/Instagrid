//
//  ButtonBar.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 14/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ButtonBar: UIView {

    @IBOutlet var selectedGrid: [UIImageView]!
    
    var delegate: ButtonBarDelegate?
    
    private func unselectButton() {
        selectedGrid.forEach({ $0.isHidden = true })
    }
    
    @IBAction func didTapFirstGridButton() {
        unselectButton()
        selectedGrid[0].isHidden = false
        delegate?.onButtonClick(buttonType: .button1)
    }
    
    @IBAction func didTapSecondGridButton() {
        unselectButton()
        selectedGrid[1].isHidden = false
        delegate?.onButtonClick(buttonType: .button2)
    }
    
    @IBAction func didTapThirdGridButton() {
        unselectButton()
        selectedGrid[2].isHidden = false
        delegate?.onButtonClick(buttonType: .button3)
    }
    
}
