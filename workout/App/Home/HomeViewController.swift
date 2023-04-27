//
//  HomeViewController.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController<HomeView> {
    
    let viewModel: HomeViewModel
    weak var coordinatorDelegate: HomeCoordinatorDelegate?
    
    
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.setup(delegate: self, dataSource: self, viewDelegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewModel.fetchAll()
        self.customView.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = UIContextualAction(style: .destructive, title: "Deletar") {  (contextualAction, view, boolValue) in
            self.viewModel.delete(item: self.viewModel.workouts[indexPath.row]) {
                tableView.reloadData()
            }
        }
        item.image = UIImage(systemName: "minus.circle.fill")
        let swipeActions = UISwipeActionsConfiguration(actions: [item])
        
        return swipeActions
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.coordinatorDelegate?.goToWorkoutDetail(item: self.viewModel.workouts[indexPath.row])
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifier) as? HomeViewCell else { return  UITableViewCell() }
        cell.setup(title: self.viewModel.workouts[indexPath.row].name ?? "", desc: self.viewModel.workouts[indexPath.row].desc ?? "")
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeViewController: HomeViewDelegate {
    func goToCreate() {
        self.coordinatorDelegate?.goToCreateWorkout()
    }
}
