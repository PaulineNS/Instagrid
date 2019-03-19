//
//  PicturesView.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 11/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class FirstGrid: ContentView {
    
    @IBOutlet var picturesPosition: [UIImageView]!
    
    var delegate: PicturesAddingDelegate?
    
    override func getNibName() -> String? {
        return "FirstGrid"
    }
    
    @IBAction func didTapFirstPicture() {
        delegate?.onPictureClick(picturePosition: .picture1)
    }
    
    @IBAction func didTapSecondPicture() {
        delegate?.onPictureClick(picturePosition: .picture2)
    }
    
    @IBAction func didTapThirdPicture() {
        delegate?.onPictureClick(picturePosition: .picture3)
    }
    
    
}
