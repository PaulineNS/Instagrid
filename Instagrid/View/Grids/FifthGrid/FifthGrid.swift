//
//  FifthGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 25/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class FifthGrid: GridHandler {

    @IBOutlet var picturesPosition: [UIImageView]!
        
    override func getXibName() -> String? {
        return "FifthGrid"
    }
    
    override func setup() {
        super.setup()
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(didTapFirstPicture))
        picturesPosition[0].isUserInteractionEnabled = true
        picturesPosition[0].addGestureRecognizer(singleTap1)
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(didTapSecondPicture))
        picturesPosition[1].isUserInteractionEnabled = true
        picturesPosition[1].addGestureRecognizer(singleTap2)
    }
    
    @objc func didTapFirstPicture() {
        selectedImage = picturesPosition[0]
        delegate?.onPictureClick(grid: self)
    }
    
    @objc func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
        delegate?.onPictureClick(grid: self)
    }
    
    override func isGridCompleted() -> Bool {
        if picturesPosition[0].image != emptyPicture && picturesPosition[1].image != emptyPicture {
            return true
        } else {
            return false
        }
    }
}
