//
//  AppCoordinator.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//Copyright © 2019 Narcis Zait. All rights reserved.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {

    let window: UIWindow
    var children: [Coordinator] = []
    var launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    
    let navigationController = UINavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        // Start your first flow here. For example, this is the
        // ideal place for deciding if you should show login or main flows.
        showMain()

        // Finally make the window key and visible.
        window.makeKeyAndVisible()
    }

    // MARK: - Flows -

    func showMain() {
        // Create your child coordinator here, add it as a child and start it.
        // Make sure you set the root view controller of the window.
        let repository = APIClient()
        
        let homeCoordinator = HomeCoordinator(navigationController: .init(), repository: repository)
        children += [homeCoordinator]
        window.rootViewController = homeCoordinator.navigationController
        
        homeCoordinator.start()
    }
}
