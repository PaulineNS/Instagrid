//
//  ViewController.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 06/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picturesGrid: UIView!
    @IBOutlet weak var firstGridButton: UIButton!
    @IBOutlet weak var secondGridButton: UIButton!
    @IBOutlet weak var thirdGridButton: UIButton!
    @IBOutlet weak var firstGridSelected: UIImageView!
    @IBOutlet weak var secondGridSelected: UIImageView!
    @IBOutlet weak var thirdGridSelected: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func gridDisplay(grid: ContentView ) {
        self.picturesGrid.subviews.forEach({ $0.removeFromSuperview() })
        picturesGrid.addSubview(grid)
        picturesGrid.autoresizesSubviews = true
    }

    @IBAction func didTapFirstGridButton() {
        selectFirstGrid()
    }
    
    private func selectFirstGrid() {
        
        firstGridSelected.isHidden = false
        secondGridSelected.isHidden = true
        thirdGridSelected.isHidden = true
        
        let firstGrid = FirstGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: firstGrid)
        
    }
    
    @IBAction func didTapSecondGridButton() {
        selectSecondGrid()
    }
    
    private func selectSecondGrid() {
        firstGridSelected.isHidden = true
        secondGridSelected.isHidden = false
        thirdGridSelected.isHidden = true
        
        let secondGrid = SecondGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: secondGrid)
    }
    
    @IBAction func didTapThirdGridButton() {
        selectThirdGrid()
    }
    
    private func selectThirdGrid() {
        firstGridSelected.isHidden = true
        secondGridSelected.isHidden = true
        thirdGridSelected.isHidden = false
        
        let thirdGrid = ThirdGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: thirdGrid)
    }
    
}





