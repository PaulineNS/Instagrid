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
    
    @IBAction func didTapFirstPicture() {
        selectedImage = picturesPosition[0]
        delegate?.onPictureClick(grid: FifthGrid())
    }
    
    @IBAction func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
        delegate?.onPictureClick(grid: FifthGrid())
    }
}
