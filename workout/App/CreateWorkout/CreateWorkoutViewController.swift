//
//  CreateWorkoutViewController.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

class CreateWorkoutViewController: BaseViewController<CreateWorkoutView> {
    
    let viewModel: CreateWorkoutViewModel
    
    init(viewModel: CreateWorkoutViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.delegate = self
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

extension CreateWorkoutViewController: CreateWorkoutViewDelegate {
    func createWorkout(name: String, desc: String) {
        self.viewModel.createWorkout(name: name, desc: desc) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
