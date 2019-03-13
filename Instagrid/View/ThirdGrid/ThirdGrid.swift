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
    @IBOutlet weak var firstPicture: UIView!
    @IBOutlet weak var secondPicture: UIView!
    @IBOutlet weak var thirdPicture: UIView!
    @IBOutlet weak var fourthPicture: UIView!
    @IBOutlet weak var addingFirstPicture: UIImageView!
    @IBOutlet weak var addingSecondPicture: UIImageView!
    @IBOutlet weak var addingThirdPicture: UIImageView!
    @IBOutlet weak var addingFourthPicture: UIImageView!
    
    
    override func getNibName() -> String? {
        return "ThirdGrid"
    }
}
