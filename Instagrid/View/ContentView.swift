//
//  ContentView.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 12/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ContentView: UIView {
    
    private var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        if let nibNameSafe = self.getNibName() {
            self.contentView = Bundle.main.loadNibNamed(nibNameSafe, owner: self, options: nil)?.first as? UIView
            self.contentView.frame = self.bounds
            self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.addSubview(contentView)
        }
    }
    
    func getNibName() -> String? {
        return nil
    }
}
