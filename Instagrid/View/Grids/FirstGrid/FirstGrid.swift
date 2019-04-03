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
    
    
    override func getXibName() -> String? {
        return "FirstGrid"
    }
    
    override func setup() {
        super.setup()
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(didTapFirstPicture))
        picturesPosition[0].isUserInteractionEnabled = true
        picturesPosition[0].addGestureRecognizer(singleTap)
    }
    
    @objc func didTapFirstPicture(sender: UIButton) {
        print ("hello")
        selectedImage = picturesPosition[sender.tag]
        delegate?.onPictureClick(grid: self)
    }
    
    @IBAction func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
        delegate?.onPictureClick(grid: self)
    }
    
    @IBAction func didTapThirdPicture() {
        delegate?.onPictureClick(grid: self)
        selectedImage = picturesPosition[2]
    }
    
    
}
