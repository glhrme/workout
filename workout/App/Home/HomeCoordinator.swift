//
//  HomeCoordinator.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinator: Coordinator?
    
    var navigationController: UINavigationController!
    
    var viewController: UIViewController?
    
    func start(viewController: UIViewController) {
        self.navigationController.pushViewController(viewController, animated: true)
        //Removendo tela de login da pilha de view controllers
        self.navigationController.viewControllers.remove(at: 0)
    }
}
