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
    let contentView = ContentView()
    let firstGrid = FirstGrid()
    let secondGrid = SecondGrid()
    let thirdGrid = ThirdGrid()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBar.delegate = self
        firstGrid.delegate = self
        secondGrid.delegate = self
        thirdGrid.delegate = self
    }
    
    func gridDisplay(grid: ContentView ) {
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
    func onPictureClick(contentView: ContentView) {
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true, completion: {self.image.delegate = contentView as UIImagePickerControllerDelegate & UINavigationControllerDelegate })
    }
}

extension ViewController: SwipeDelegate {
    func onSwipeSymbol() {
        let activityController = UIActivityViewController(activityItems: [picturesGrid], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
}




