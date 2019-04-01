//
//  ContentView.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 12/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class GridHandler: UIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var delegate: PicturesAddingDelegate?
    var selectedImage: UIImageView?
    private var gridHandler: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        if let xibName = self.getXibName() {
            self.gridHandler = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as? UIView
            self.gridHandler.frame = self.bounds
            self.gridHandler.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.addSubview(gridHandler)
        }
    }
    
    func getXibName() -> String? {
        return nil
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if let imageView = selectedImage {
                imageView.contentMode = .scaleAspectFit
                imageView.image = pickedImage
                selectedImage = nil
            }
        } else {
            print ("Error. Please try again later")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
