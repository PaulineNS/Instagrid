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
    
    @IBOutlet weak var buttonBar: ButtonBar!
    
    @IBAction func didDoubleTapToChangeGridColour(_ sender: UITapGestureRecognizer) {
        picturesGrid.backgroundColor = UIColor (red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    let image = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBar.buttonDelegate = self
        image.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        buttonBar.didTapFirstGridButton()
    }
    
    func gridDisplay(grid: GridHandler ) {
        grid.delegate = self
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
    
    private func selectFourthGrid(){
        let fourthGrid = FourthGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: fourthGrid)
    }
    
    private func selectFifthGrid(){
        let fifthGrid = FifthGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: fifthGrid)
    }

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
        case .button4:
            selectFourthGrid()
        case .button5:
            selectFifthGrid()
        }
    }
}

extension ViewController: PicturesAddingDelegate {
    func onPictureClick(grid: GridHandler) {
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.image.sourceType = .camera
                self.present(self.image, animated: true, completion: nil)
            } else {
                print ("The Camera is not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            self.image.sourceType = .photoLibrary
            self.present(self.image, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}

extension ViewController: SwipeDelegate {
    func onSwipeSymbol() {
        let activityController = UIActivityViewController(activityItems: [picturesGrid], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
}



