//
//  HomeCoordinator.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func goToCreateWorkout() -> Void
}

class HomeCoordinator: Coordinator {
    
    var childCoordinator: Coordinator?
    
    var navigationController: UINavigationController!
    
    var viewController: UIViewController?
    
    func start(viewController: UIViewController) {
        guard let vc = viewController as? HomeViewController else { return }
        vc.coordinatorDelegate = self
        self.viewController = vc
        self.navigationController.pushViewController(vc, animated: true)
        //Removendo tela de login da pilha de view controllers
        self.navigationController.viewControllers.remove(at: 0)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func goToCreateWorkout() {
        let viewController = CreateWorkoutViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
