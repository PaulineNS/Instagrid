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
        selectedImage = picturesPosition[0]
    }
    
    @IBAction func didTapSecondPicture() {
        selectedImage = picturesPosition[1]
    }
    
    @IBAction func didTapThirdPicture() {
        selectedImage = picturesPosition[2]
    }
    
    @IBAction func didTapFourthPicture() {
        selectedImage = picturesPosition[3]
    }
}
