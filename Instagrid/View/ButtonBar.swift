//
//  ButtonBar.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 14/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ButtonBar: UIViewController {
    
    @IBOutlet weak var buttonSpace: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var selected: [UIImageView]!
    
    weak var delegate: ButtonBarDelegate?
    
    
    @IBAction func didTapFirstGridButton() {
        selectFirstGrid()
        delegate?.didReceiveData()
    }
    
    private func selectFirstGrid() {
        
        buttons[0].isHidden = true
        buttons[1].isHidden = true
        buttons[2].isHidden = true
    }
    
    @IBAction func didTapSecondGridButton() {
        selectSecondGrid()
        delegate?.didReceiveData()
    }
    
    private func selectSecondGrid() {
        buttons[0].isHidden = true
        buttons[1].isHidden = true
        buttons[2].isHidden = true
    }
    
    @IBAction func didTapThirdGridButton() {
        selectThirdGrid()
        delegate?.didReceiveData()
    }
    
    private func selectThirdGrid() {
        buttons[0].isHidden = true
        buttons[1].isHidden = true
        buttons[2].isHidden = true
    }
    
}
