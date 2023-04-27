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
        self.customView.setup(name: self.viewModel.workout.name ?? "", desc: self.viewModel.workout.desc ?? "", delegate: self, dataSource: self, viewDelegate: self)
    }
}

extension WorkoutDetailViewController: WorkoutDetailViewDelegate {
    
}

extension WorkoutDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension WorkoutDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.identifier) as? WorkoutTableViewCell else { return  UITableViewCell() }
        cell.setup(title: "Teste", notes: "Anotações")
        cell.selectionStyle = .none
        return cell
    }
}
