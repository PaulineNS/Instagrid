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
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(didTapFirstPicture))
        picturesPosition[0].isUserInteractionEnabled = true
        picturesPosition[0].addGestureRecognizer(singleTap1)
        let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(didTapSecondPicture))
        picturesPosition[1].isUserInteractionEnabled = true
        picturesPosition[1].addGestureRecognizer(singleTap2)
        let singleTap3 = UITapGestureRecognizer(target: self, action: #selector(didTapThirdPicture))
        picturesPosition[2].isUserInteractionEnabled = true
        picturesPosition[2].addGestureRecognizer(singleTap3)
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
    
    override func isGridCompleted() -> Bool {
        if picturesPosition[0].image != emptyPicture && picturesPosition[1].image != emptyPicture && picturesPosition[2].image != emptyPicture {
                return true
        } else {
            let shareAlert = UIAlertController(title: "You need to set all images before sharing!", message: "", preferredStyle: .alert)
            shareAlert.addAction(UIAlertAction(title: "Ok 👍", style: .default, handler: nil))
            return false
        }
    }
    
}
