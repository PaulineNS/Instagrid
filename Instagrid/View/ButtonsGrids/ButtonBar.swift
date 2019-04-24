//
//  ButtonBar.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 14/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ButtonBar: UIScrollView {
    
    var buttonDelegate: ButtonBarDelegate?
    
    // Outlet
    @IBOutlet var selectedGrid: [UIImageView]!
    
    private func unselectButton() {
        selectedGrid.forEach({ $0.isHidden = true })
    }
    
    // Actions
    @IBAction func didTapFirstGridButton() {
        unselectButton()
        selectedGrid[0].isHidden = false
        buttonDelegate?.onButtonClick(buttonType: .button1)
    }
    
    @IBAction func didTapSecondGridButton() {
        unselectButton()
        selectedGrid[1].isHidden = false
        buttonDelegate?.onButtonClick(buttonType: .button2)
    }
    
    @IBAction func didTapThirdGridButton() {
        unselectButton()
        selectedGrid[2].isHidden = false
        buttonDelegate?.onButtonClick(buttonType: .button3)
    }
    
    @IBAction func didTapFourthGridButton() {
        unselectButton()
        selectedGrid[3].isHidden = false
        buttonDelegate?.onButtonClick(buttonType: .button4)
    }
    
    @IBAction func didTapFifthGridButton() {
        unselectButton()
        selectedGrid[4].isHidden = false
        buttonDelegate?.onButtonClick(buttonType: .button5)
    }
}
