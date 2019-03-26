//
//  ThirdGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 13/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ThirdGrid: GridHandler {
    
    @IBOutlet var picturesPosition: [UIImageView]!
    
    var delegate: PicturesAddingDelegate?
 
    override func getXibName() -> String? {
        return "ThirdGrid"
    }
    
    @IBAction func didTapFirstPicture() {
        selectedImage = picturesPosition[0]
        delegate?.onPictureClick(grid: ThirdGrid())
    }
    
    @IBAction func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
        delegate?.onPictureClick(grid: ThirdGrid())
    }
    
    @IBAction func didTapThirdPicture() {
        selectedImage = picturesPosition[2]
        delegate?.onPictureClick(grid: ThirdGrid())
    }
    
    @IBAction func didTapFourthPicture() {
        selectedImage = picturesPosition[3]
        delegate?.onPictureClick(grid: ThirdGrid())
    }
}
