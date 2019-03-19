//
//  ThirdGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 13/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ThirdGrid: ContentView {
    
    @IBOutlet var picturesPosition: [UIImageView]!
    
    var delegate: PicturesAddingDelegate?
 
    override func getNibName() -> String? {
        return "ThirdGrid"
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
    
    @IBAction func didTapFourthPicture() {
        delegate?.onPictureClick(picturePosition: .picture4)
    }
}
