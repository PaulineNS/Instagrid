//
//  UIViewExtension.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 17/04/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

// source: https://stackoverflow.com/questions/30696307/how-to-convert-a-uiview-to-an-image
// To convert an object in image
extension UIView {
    
    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
}
