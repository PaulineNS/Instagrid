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
    
    @IBOutlet weak var picturesGrid: UIView!
    
    @IBOutlet weak var buttonBar: ButtonBar!
    
    @IBOutlet weak var swipe: SwipeView!
    
    @IBAction func didDoubleTapToChangeGridColour(_ sender: UITapGestureRecognizer) {
        picturesGrid.backgroundColor = UIColor (red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    let image = UIImagePickerController()
    
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
    
    private func selectFourthGrid() {
        
        let fourthGrid = FourthGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: fourthGrid)
    }
    
    private func selectFifthGrid() {
        
        let fifthGrid = FifthGrid(frame: picturesGrid.bounds)
        gridDisplay(grid: fifthGrid)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        swipe.swipeOrientation()
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
        image.delegate = grid
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
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
                        let alert = UIAlertController(title: "Photo Library Denied", message: "Photo Library access was previously denied. Please update your Settings if you wish to change this.", preferredStyle: .alert)
                        let goToSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
                            DispatchQueue.main.async {
                                let url = URL(string: UIApplication.openSettingsURLString)!
                                UIApplication.shared.open(url, options: [:])
                            }
                        }
                        alert.addAction(goToSettingsAction)
                        
                    }
                }
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        }
    }

extension ViewController: SwipeDelegate {
    func onSwipeSymbol() {
        if let grid = picturesGrid.subviews[0] as? GridHandler, grid.isGridCompleted() {
        let activityController = UIActivityViewController(activityItems: [picturesGrid], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
        } else {
            let shareAlert = UIAlertController(title: "You need to set all images before sharing!", message: "", preferredStyle: .alert)
            shareAlert.addAction(UIAlertAction(title: "Ok 👍", style: .default))
            present(shareAlert, animated: true)
        }
    }
}




