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
    
    let buttonBar = ButtonBar()
    let gridHandler = GridHandler()
    let firstGrid = FirstGrid()
    let secondGrid = SecondGrid()
    let thirdGrid = ThirdGrid()
    
    @IBAction func didDoubleTapToChangeGridColour(_ sender: UITapGestureRecognizer) {
        picturesGrid.backgroundColor = UIColor (red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func gridDisplay(grid: GridHandler ) {
        self.picturesGrid.subviews.forEach({ $0.removeFromSuperview() })
        picturesGrid.addSubview(grid)
        picturesGrid.autoresizesSubviews = true
    }
    
    private func selectFirstGrid() {
        
        let firstGrid = FirstGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: firstGrid)
        
    }
    
    private func selectSecondGrid() {
        
        let secondGrid = SecondGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: secondGrid)
    }
    
    private func selectThirdGrid() {
        let thirdGrid = ThirdGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: thirdGrid)
    }
    
    let image = UIImagePickerController()

}

extension ViewController: ButtonBarDelegate {
    func onButtonClick(buttonType: ButtonType) {
        switch buttonType {
        case .button1:
            selectFirstGrid()
        case .button2:
            selectSecondGrid()
        case .button3:
            selectThirdGrid()
        }
    }
}

extension ViewController: PicturesAddingDelegate {
    func onPictureClick(grid: GridHandler) {
        image.sourceType = .photoLibrary // how adding camera ??
        image.allowsEditing = false
        self.present(image, animated: true, completion: {self.image.delegate = grid as UIImagePickerControllerDelegate & UINavigationControllerDelegate })
    }
}

extension ViewController: SwipeDelegate {
    func onSwipeSymbol() {
        let activityController = UIActivityViewController(activityItems: [picturesGrid], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
}




