//
//  SecondGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 11/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class SecondGrid: ContentView {
    
    @IBOutlet var picturesPosition: [UIImageView]!
    
    var delegate: PicturesAddingDelegate?
    
    override func getNibName() -> String? {
        return "SecondGrid"        
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
    
}

