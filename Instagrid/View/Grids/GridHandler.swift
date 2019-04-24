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
    
    func getXibName() -> String? { //Obtain the Xibname of the selected grid
        return nil
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if let imageView = selectedUIImageView {
                imageView.contentMode = .scaleAspectFill
                imageView.image = pickedImage
            } else {
                let alert = UIAlertController(title: "Error. Please Try again later !", message: "", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
            }
        } else {
            let alert = UIAlertController(title: "Error. Please Try again later !", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
        }
        
        picker.dismiss(animated: true, completion: nil) //Remove the view
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    } //Remove the view when the user click on cancel
    
    func isGridCompleted()  -> Bool { //Checking if the grid is completed
        return true
    }
}
