//
//  AppDelegate.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 06/03/2019.
//  Copyright © 2019 PaulineNomballais. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = AppCoordinator(appDelegate: self)
        coordinator.start()
        return true
    }

}

