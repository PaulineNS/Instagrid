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
        picturesPosition[0].image = emptyPicture
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(didTapSecondPicture))
        picturesPosition[1].isUserInteractionEnabled = true
        picturesPosition[1].addGestureRecognizer(singleTap2)
        picturesPosition[1].image = emptyPicture
    }
    
    @objc func didTapFirstPicture() {
        selectedUIImageView = picturesPosition[0]
        delegate?.onPictureClick(grid: self)
    }
    
    @objc func didTapSecondPicture() {
        selectedUIImageView = picturesPosition[1]
        delegate?.onPictureClick(grid: self)
    }
    
    override func isGridCompleted() -> Bool {
        for image in picturesPosition {
            if image.image == emptyPicture {
                return false
            }
        }
        return true
    }
}
