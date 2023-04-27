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
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.setupDelegate(delegate: self, dataSource: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewModel.createWorkout()
        self.customView.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifier) as? HomeViewCell else { return  UITableViewCell() }
        cell.setup(title: self.viewModel.workouts[indexPath.row].name ?? "", desc: self.viewModel.workouts[indexPath.row].desc ?? "")
        return cell
    }
}
