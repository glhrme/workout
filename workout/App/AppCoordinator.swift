//
//  AppCoordinator.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit
import FirebaseAuth

protocol Coordinator {
    var childCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController!  { get set }
    var viewController: UIViewController?  { get set }
    
    func start(viewController: UIViewController) -> Void
}

class AppCoordinator {
    var childCoordinator: Coordinator?
    
    var navigationController: UINavigationController!
    
    var viewController: UIViewController?
    
    func start(window: UIWindow) {
        let controller = LoginViewController()
        controller.coordinatorDelegate = self
        self.viewController = controller
        self.navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func goToHome(user: User) {
        let coordinator = HomeCoordinator()
        coordinator.navigationController = self.navigationController
        childCoordinator = coordinator
        childCoordinator?.start(viewController: HomeViewController())
    }
}
