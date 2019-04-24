//
//  ViewController.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 06/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController {
    
    // Vars
    let image = UIImagePickerController()
    
    // Outlets
    @IBOutlet weak var picturesGrid: UIView!
    @IBOutlet weak var buttonBar: ButtonBar!
    @IBOutlet weak var swipe: SwipeView!
    
    // View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBar.buttonDelegate = self
        buttonBar.didTapFirstGridButton()
        swipe.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        swipe.swipeOrientation()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        swipe.swipeOrientation()
    }
    
    // Action
    // Changing the grid color when double tap
    @IBAction func didDoubleTapToChangeGridColour(_ sender: UITapGestureRecognizer) {
        picturesGrid.backgroundColor = UIColor (red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}

extension ViewController: ButtonBarDelegate {
    func onButtonClick(buttonType: ButtonType) {
        var grid: GridHandler
        switch buttonType {
        case .button1:
            grid = FirstGrid(frame: picturesGrid.bounds)
        case .button2:
            grid = SecondGrid(frame: picturesGrid.bounds)
        case .button3:
            grid = ThirdGrid(frame: picturesGrid.bounds)
        case .button4:
            grid = FourthGrid(frame: picturesGrid.bounds)
        case .button5:
            grid = FifthGrid(frame: picturesGrid.bounds)
        }
        gridDisplay(grid: grid)
    }
    
    private func gridDisplay(grid: GridHandler ) {
        grid.delegate = self
        self.picturesGrid.subviews.forEach({ $0.removeFromSuperview() })
        picturesGrid.addSubview(grid)
        picturesGrid.autoresizesSubviews = true
    }
}

// Tapping for adding pictures
extension ViewController: PicturesAddingDelegate {
    private func showDeniedAlertForPhotoLibrary() {
        let alert = UIAlertController(title: "Photo Library Denied", message: "Photo Library access was previously denied. Please update your Settings if you wish to change this.", preferredStyle: .alert)
        let goToSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
            DispatchQueue.main.async {
                let url = URL(string: UIApplication.openSettingsURLString)!
                UIApplication.shared.open(url, options: [:])
            }
        }
        alert.addAction(goToSettingsAction)
    }
    
    // Tapping for adding pictures
    func onPictureClick(grid: GridHandler) {
        image.delegate = grid
        
        // Selecting source of pictures
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            //Access to camera
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video) {
                case .authorized:
                    self.image.sourceType = .camera
                    self.present(self.image, animated: true, completion: nil)
                case .notDetermined:
                    if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == AVAuthorizationStatus.authorized {
                        self.image.sourceType = .camera
                        self.present(self.image, animated: true, completion: nil)
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Camera Restricted", message: "Camera access is restricted and cannot be accessed", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okAction)
                case .denied:
                    let alert = UIAlertController(title: "Camera Denied", message: "Camera access was previously denied. Please update your Settings if you wish to change this.", preferredStyle: .alert)
                    let goToSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                    alert.addAction(goToSettingsAction)
                }
            } else {
                print ("The Camera is not available")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            
            // Access to photo library
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                PHPhotoLibrary.requestAuthorization { (status) in
                    switch status {
                    case .authorized:
                        self.image.sourceType = .photoLibrary
                        self.present(self.image, animated: true, completion: nil)
                    case .notDetermined:
                        if status == PHAuthorizationStatus.authorized {
                            self.image.sourceType = .photoLibrary
                            self.present(self.image, animated: true, completion: nil)
                        }
                    case .restricted:
                        let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library access is restricted and cannot be accessed", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default)
                        alert.addAction(okAction)
                    case .denied:
                        self.showDeniedAlertForPhotoLibrary()
                    }
                }
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
        }
    }

// Swiping
extension ViewController: SwipeDelegate {
    func onSwipeSymbol() {
        if let grid = picturesGrid.subviews[0] as? GridHandler, grid.isGridCompleted() {
            animateSharing()
        } else {
            // The grid must be completed for the sharing
            let shareAlert = UIAlertController(title: "You need to set all images before sharing!", message: "", preferredStyle: .alert)
            shareAlert.addAction(UIAlertAction(title: "Ok 👍", style: .default))
            present(shareAlert, animated: true)
        }
    }
    
    // Animate the grid when swipe according to orientation of screen
    func animateSharing() {
        let screenWidth = UIScreen.main.bounds.width //width of the screen
        let screenHeight = UIScreen.main.bounds.height //height of the screen
        
        var translationTransform: CGAffineTransform
        
        if UIDevice.current.orientation.isPortrait {
            translationTransform = CGAffineTransform(translationX: 0, y: -screenHeight)
        } else {
            translationTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            self.picturesGrid.transform = translationTransform
        }) { (success) in
            if success {
                // To share the grid on other applications or to save it
                let activityController = UIActivityViewController(activityItems: [self.picturesGrid.asImage()], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
                self.animateTheGridDisplay()
            }
        }
    }
    
    // Animate the grid return after the swipe
    func animateTheGridDisplay() {
        
        picturesGrid.transform = .identity
        picturesGrid.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.picturesGrid.transform = .identity
        }, completion:nil)
    }
}




