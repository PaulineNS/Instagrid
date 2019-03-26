//
//  FourthGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 25/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class FourthGrid: GridHandler {

    @IBOutlet var picturesPosition: [UIImageView]!
    
    var delegate: PicturesAddingDelegate?
    
    override func getXibName() -> String? {
        return "FourthGrid"
    }
    
    @IBAction func didTapFirstPicture() {
        selectedImage = picturesPosition[0]
        delegate?.onPictureClick(grid: FourthGrid())
    }
    
    @IBAction func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
        delegate?.onPictureClick(grid: FourthGrid())
    }
    
}
