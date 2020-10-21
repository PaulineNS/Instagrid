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

final class MainViewController: UIViewController {
    
    let image = UIImagePickerController()
    var viewModel: MainViewModel!
    
    @IBOutlet weak var picturesGrid: PicturesGrid!
    @IBOutlet weak var buttonBar: ButtonBar!
    @IBOutlet weak var swipe: SwipeView!
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBar.buttonDelegate = picturesGrid
        swipe.delegate = self
        picturesGrid.delegate = self
        buttonBar.didTapFirstGridButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        swipe.swipeOrientation()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        swipe.swipeOrientation()
    }
   
    @IBAction func didDoubleTapToChangeGridColour(_ sender: UITapGestureRecognizer) {
        picturesGrid.backgroundColor = UIColor (red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}

extension MainViewController: PicturesAddingDelegate {
    
    func onPictureClick(grid: GridHandler) {
        image.delegate = grid
        
        // Selecting source of pictures
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            //Access to camera
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video) {
                case .authorized:
                    self.authorizedAccessToCamera()
                case .notDetermined:
                    if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == AVAuthorizationStatus.authorized {
                        self.authorizedAccessToCamera()
                    }
                case .restricted:
                    self.showRestrictedAlertForCamera()
                case .denied:
                    self.showDeniedAlertForCamera()
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
                        self.authorizedAccessToPhotoLibrary()
                    case .notDetermined:
                        if status == PHAuthorizationStatus.authorized {
                            self.authorizedAccessToPhotoLibrary()
                        }
                    case .restricted:
                        self.showRestrictedAlertForPhotoLibrary()
                    case .denied:
                        self.showDeniedAlertForPhotoLibrary()
                    case .limited:
                        self.showDeniedAlertForPhotoLibrary()
                    }
                }
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
        }
    
    // Different access to the photo library
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
    
    private func showRestrictedAlertForPhotoLibrary() {
        let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library access is restricted and cannot be accessed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
    }
    
    private func authorizedAccessToPhotoLibrary() {
        DispatchQueue.main.async {
            self.image.sourceType = .photoLibrary
            self.present(self.image, animated: true, completion: nil)
        }
    }
    
    // Different access to the camera
    private func showDeniedAlertForCamera() {
        let alert = UIAlertController(title: "Camera Denied", message: "Camera access was previously denied. Please update your Settings if you wish to change this.", preferredStyle: .alert)
        let goToSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
            DispatchQueue.main.async {
                let url = URL(string: UIApplication.openSettingsURLString)!
                UIApplication.shared.open(url, options: [:])
            }
        }
        alert.addAction(goToSettingsAction)
    }
    
    private func showRestrictedAlertForCamera() {
        let alert = UIAlertController(title: "Camera Restricted", message: "Camera access is restricted and cannot be accessed", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
    }
    
    private func authorizedAccessToCamera() {
        self.image.sourceType = .camera
        self.present(self.image, animated: true, completion: nil)
    }
    
}

extension MainViewController: SwipeDelegate {
    
    func onSwipeSymbol() {
        guard let grid = picturesGrid.subviews[0] as? GridHandler else { return }
        viewModel.isGridCompleted(for: grid) { response in
            if response {
                self.animateSharing()
            }
        }
    }
    
    func animateSharing() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
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
