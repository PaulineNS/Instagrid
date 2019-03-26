//
//  PicturesView.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 11/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class FirstGrid: GridHandler {
    
    @IBOutlet var picturesPosition: [UIImageView]!
    
    var delegate: PicturesAddingDelegate?
    
    override func getXibName() -> String? {
        return "FirstGrid"
    }
    
    @IBAction func didTapFirstPicture() {
        selectedImage = picturesPosition[0]
        delegate?.onPictureClick(grid: FirstGrid())
    }
    
    @IBAction func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
        delegate?.onPictureClick(grid: FirstGrid())
    }
    
    @IBAction func didTapThirdPicture() {
        selectedImage = picturesPosition[2]
        delegate?.onPictureClick(grid: FirstGrid())
    }
    
    
}
