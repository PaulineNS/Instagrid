//
//  ThirdGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 13/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ThirdGrid: ContentView {

    @IBOutlet weak var gridView: UIView!
    @IBOutlet var picturesPosition: [UIView]!
    @IBOutlet var addingPictures: [UIImageView]!
    
    
    override func getNibName() -> String? {
        return "ThirdGrid"
    }
}
