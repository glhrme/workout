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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension WorkoutDetailViewController: AddExerciseViewModelDelegate {
    func update() {
        self.viewModel.fetch {
            self.customView.tableView.reloadData()
        }
    }
}

extension WorkoutDetailViewController: WorkoutDetailViewDelegate {
    func addExercise() {
        let viewModel = AddExerciseViewModel(workout: self.viewModel.workout)
        viewModel.delegate = self
        self.present(AddExerciseViewController(viewModel: viewModel), animated: true)
    }
}

extension WorkoutDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension WorkoutDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.workout.exercises?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.identifier) as? WorkoutTableViewCell else { return  UITableViewCell() }
        guard let exercises = self.viewModel.workout.exercises else { return UITableViewCell() }
        cell.setup(title: Array(exercises)[indexPath.row].name ?? "", notes: Array(exercises)[indexPath.row].notes ?? "", imageUrl: Array(exercises)[indexPath.row].image ?? "")
        cell.selectionStyle = .none
        return cell
    }
}
