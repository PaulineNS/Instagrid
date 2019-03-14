//
//  PicturesView.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 11/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class FirstGrid: ContentView {
    
    @IBOutlet weak var gridView: UIView!
    @IBOutlet var picturesPosition: [UIView]!
    @IBOutlet var addingPictures: [UIImageView]!
    
    
    
    override func getNibName() -> String? {
        return "FirstGrid"
    }
}
