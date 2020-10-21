//
//  AppCoordinator.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 19/10/2020.
//  Copyright © 2020 PaulineNomballais. All rights reserved.
//

import UIKit

final class AppCoordinator {

    // MARK: - Private properties

    private unowned var appDelegate: AppDelegate
    private var mainCoordinator: MainCoordinator?

    // MARK: - Initializer

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    // MARK: - Coordinator

    func start() {
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window!.rootViewController = UIViewController()
        appDelegate.window!.makeKeyAndVisible()

        if ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "YES" {
            return
        }

        showGrid()
    }

    private func showGrid() {
        mainCoordinator = MainCoordinator(presenter: appDelegate.window!)
        mainCoordinator?.start()
    }
}
