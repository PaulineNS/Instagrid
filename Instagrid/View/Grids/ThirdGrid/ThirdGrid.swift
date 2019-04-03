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
    
 
    override func getXibName() -> String? {
        return "ThirdGrid"
    }
    
    override func setup() {
        super.setup()
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(didTapFirstPicture))
        picturesPosition[0].isUserInteractionEnabled = true
        picturesPosition[0].addGestureRecognizer(singleTap1)
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(didTapSecondPicture))
        picturesPosition[1].isUserInteractionEnabled = true
        picturesPosition[1].addGestureRecognizer(singleTap2)
        let singleTap3 = UITapGestureRecognizer(target: self, action: #selector(didTapThirdPicture))
        picturesPosition[2].isUserInteractionEnabled = true
        picturesPosition[2].addGestureRecognizer(singleTap3)
        let singleTap4 = UITapGestureRecognizer(target: self, action: #selector(didTapFourthPicture))
        picturesPosition[3].isUserInteractionEnabled = true
        picturesPosition[3].addGestureRecognizer(singleTap4)
    }
    
    @objc func didTapFirstPicture() {
        selectedImage = picturesPosition[0]
        delegate?.onPictureClick(grid: self)
    }
    
    @objc func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
        delegate?.onPictureClick(grid: self)
    }
    
    @objc func didTapThirdPicture() {
        selectedImage = picturesPosition[2]
        delegate?.onPictureClick(grid: self)
    }
    
    @objc func didTapFourthPicture() {
        selectedImage = picturesPosition[3]
        delegate?.onPictureClick(grid: self)
    }
}
