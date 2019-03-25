//
//  FifthGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 25/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class FifthGrid: ContentView {

    @IBOutlet var picturesPosition: [UIImageView]!
    
    var delegate: PicturesAddingDelegate?
    
    override func getNibName() -> String? {
        return "FifthGrid"
    }
    
    @IBAction func didTapFirstPicture() {
        selectedImage = picturesPosition[0]
        delegate?.onPictureClick(contentView: FifthGrid())
    }
    
    @IBAction func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
        delegate?.onPictureClick(contentView: FifthGrid())
    }
}
