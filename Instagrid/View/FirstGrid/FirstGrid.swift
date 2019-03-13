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
    @IBOutlet weak var firstPicture: UIView!
    @IBOutlet weak var secondPicture: UIView!
    @IBOutlet weak var thirdPicture: UIView!
    @IBOutlet weak var addingFirstPicture: UIImageView!
    @IBOutlet weak var addingSecondPicture: UIImageView!
    @IBOutlet weak var addingThirdPicture: UIImageView!
    
    /* required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: "FirstGrid", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(gridView)
        gridView.frame = self.bounds
    } */
    
    override func getNibName() -> String? {
        return "FirstGrid"
    }
}
