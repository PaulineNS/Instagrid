//
//  ViewController.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 06/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var picturesGrid: UIView!
    
    let buttonBar = ButtonBar()
    let firstGrid = FirstGrid()
    let secondGrid = SecondGrid()
    let thirdGrid = ThirdGrid()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBar.delegate = self
        firstGrid.delegate = self
        secondGrid.delegate = self
        thirdGrid.delegate = self
        image.delegate = self
        
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
    
    func getImageFromLibrary() {
        image.sourceType = .photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true, completion: {self.image.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            //myimageview.contentMode = .ScaleAspectFit
            //myimageview.image = pickedImage
        } else {
            // error message
        }
        
        picker.dismiss(animated: true, completion: nil)
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
        }
    }
}

extension ViewController: PicturesAddingDelegate {
    func onPictureClick(picturePosition: PicturesPosition) {
        switch picturePosition {
        case .picture1:
            getImageFromLibrary()
            imagePickerController(UIImagePickerController, didFinishPickingMediaWithInfo: [UIImagePickerController.InfoKey : Any])
        case .picture2:
            getImageFromLibrary()
        case .picture3:
            getImageFromLibrary()
        case .picture4:
            getImageFromLibrary()
        }
    }
}





