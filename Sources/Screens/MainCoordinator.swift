//
//  GridCoordinator.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 19/10/2020.
//  Copyright © 2020 PaulineNomballais. All rights reserved.
//

import UIKit

final class MainCoordinator {

    // MARK: - Properties

    private let presenter: UIWindow
    private let screens: Screens
    private var gridController: UIViewController

    // MARK: - Init

    init(presenter: UIWindow) {
        self.presenter = presenter
        self.screens = Screens()
        self.gridController = UIViewController()
    }
    
    // MARK: - Coordinator

    func start() {
        gridController = screens.createHome(delegate: self)
        presenter.rootViewController = gridController
    }
    
    // MARK: - SimpleAlert

    private func showSimpleAlert(for type: AlertType) {
        let alert = screens.createAlert(for: type)
        
        self.gridController.present(alert, animated: true, completion: nil)
    }
    
}

extension MainCoordinator: GridScreenDelegate {
    func gridScreenShouldDisplayAlert(for type: AlertType) {
        showSimpleAlert(for: type)
    }
}
