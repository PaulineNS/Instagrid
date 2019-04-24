//
//  PicturesGrid.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 24/04/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class PicturesGrid: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.subviews.count > 0 {
            self.subviews[0].frame = self.bounds
        }
    }
}
