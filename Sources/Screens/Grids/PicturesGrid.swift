//
//  PicturesGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 24/04/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class PicturesGrid: UIView {
    
    var delegate: PicturesAddingDelegate?
    var buttonBar: ButtonBar?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.subviews.count > 0 {
            self.subviews[0].frame = self.bounds
        }
    }
}

//Display the good grid according to the clicked button
extension PicturesGrid: ButtonBarDelegate {
    func onButtonClick(buttonType: ButtonType) {
        var grid: GridHandler
        switch buttonType {
        case .button1:
            grid = FirstGrid(frame: self.bounds)
        case .button2:
            grid = SecondGrid(frame: self.bounds)
        case .button3:
            grid = ThirdGrid(frame: self.bounds)
        case .button4:
            grid = FourthGrid(frame: self.bounds)
        case .button5:
            grid = FifthGrid(frame: self.bounds)
        }
        gridDisplay(grid: grid)
    }
    
    // Adapting the size grid to the container square
    private func gridDisplay(grid: GridHandler ) {
        grid.delegate = self.delegate
        self.subviews.forEach({ $0.removeFromSuperview() })
        self.addSubview(grid)
        self.autoresizesSubviews = true
    }
}
