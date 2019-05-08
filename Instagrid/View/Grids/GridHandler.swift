//
//  ContentView.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 12/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class GridHandler: UIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Vars
    let emptyPicture = UIImage(named: "Blue Cross")
    var selectedUIImageView: UIImageView?
    private var view: UIView!
    var delegate : PicturesAddingDelegate?

    // GridHandler Initialisation
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // Adapt the grid to the container
    func setup() {
        if let xibName = self.getXibName() {
            self.view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as? UIView //Downloading the xibView
            self.view.frame = self.bounds //Adapting the xib to the UIView size
            self.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.addSubview(view) //Adding the xib to the SubView
        } else {
            print ("Missing Xib Name")
        }
    }
    
    //Obtain the Xibname of the selected grid
    func getXibName() -> String? {
        return nil
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if let imageView = selectedUIImageView {
                imageView.contentMode = .scaleAspectFill
                imageView.image = pickedImage
            } else {
                print ("selectedUIImageView is nil")
            }
        } else {
            print ("info[UIImagePickerController.InfoKey.originalImage] isn't an UIImage")
        }
        
        //Remove the view
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Remove the view when the user click on cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Checking if the grid is completed
    func isGridCompleted()  -> Bool {
        return true
    }
}
