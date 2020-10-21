//
//  Screens.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 19/10/2020.
//  Copyright © 2020 PaulineNomballais. All rights reserved.
//

import UIKit

final class Screens {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Screens.self))

    func createHome(delegate: GridScreenDelegate) -> UIViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier:
            "GridViewController") as! MainViewController
        let viewModel = MainViewModel(delegate: delegate)
        viewController.viewModel = viewModel
        return viewController
    }

}

// MARK: - Simple Alert

extension Screens {

    func createAlert(for type: AlertType) -> UIAlertController {
        let alert = Alert(type: type)
        let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(action)
        return alertController
    }

}

protocol ButtonBarDelegate: class {
    func onButtonClick(buttonType: ButtonType)
}

protocol SwipeDelegate: class {
    func onSwipeSymbol()
}

protocol PicturesAddingDelegate: class {
    func onPictureClick(grid: GridHandler)
}

protocol GridScreenDelegate: class {
    func gridScreenShouldDisplayAlert(for type: AlertType)
}
