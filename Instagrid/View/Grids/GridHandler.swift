//
//  ContentView.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 12/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class GridHandler: UIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let emptyPicture = UIImage(named: "Blue Cross")

    var delegate : PicturesAddingDelegate?
    
    var selectedUIImageView: UIImageView?
    private var view: UIView!
    
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
            self.view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as? UIView
            self.view.frame = self.bounds
            self.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.addSubview(view)
        } else {
            print ("Missing Xib Name")
        }
    }
    
    func getXibName() -> String? {
        return nil
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if let imageView = selectedUIImageView {
                imageView.contentMode = .scaleAspectFill
                imageView.image = pickedImage
            } else {
                // print + user message
            }
        } else {
            print ("Error. Please try again later") // making an alert
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func isGridCompleted()  -> Bool {
        return true
    }
}
