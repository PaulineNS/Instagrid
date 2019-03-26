//
//  SecondGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 11/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class SecondGrid: GridHandler {
    
    @IBOutlet var picturesPosition: [UIImageView]!
    
    var delegate: PicturesAddingDelegate?
    
    override func getXibName() -> String? {
        return "SecondGrid"        
    }
    
    @IBAction func didTapFirstPicture() {
        selectedImage = picturesPosition[0]
        delegate?.onPictureClick(grid: SecondGrid())
    }
    
    @IBAction func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
        delegate?.onPictureClick(grid: SecondGrid())
    }
    
    @IBAction func didTapThirdPicture() {
        selectedImage = picturesPosition[2]
        delegate?.onPictureClick(grid: SecondGrid())
    }
    
}

