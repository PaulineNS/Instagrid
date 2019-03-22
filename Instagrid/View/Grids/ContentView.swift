//
//  ContentView.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 12/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

class ContentView: UIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var selectedImage: UIImageView?
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            if let imageView = selectedImage {
                imageView.contentMode = .scaleAspectFit
                imageView.image = pickedImage
                selectedImage = nil
            }
        } else {
            // error message
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
