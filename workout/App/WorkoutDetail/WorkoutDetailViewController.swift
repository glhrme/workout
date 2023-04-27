//
//  WorkoutDetailViewController.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

class WorkoutDetailViewController: BaseViewController<WorkoutDetailView> {
    let viewModel: WorkoutDetailViewModel
    
    init(viewModel: WorkoutDetailViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
}
