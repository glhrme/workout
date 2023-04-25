//
//  AppCoordinator.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit

class AppCoordinator {
    private var navigationController: UINavigationController?
    
    var vc: LoginViewController?
    
    func start(window: UIWindow) {
        let controller = LoginViewController()
        self.vc = controller
        self.navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
}
