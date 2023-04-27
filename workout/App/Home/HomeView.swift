//
//  HomeView.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit

class HomeView: BaseUIView {
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "WORKOUT"
        label.textColor = .customBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.usePoppins(.semiBold, size: 32)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(HomeViewCell.self, forCellReuseIdentifier: HomeViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.allowsSelection = false
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    func setupDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
        self.tableView.reloadData()
    }
}

extension HomeView: ViewCode {
    func buildViewHierrachy() {
        self.addSubview(container)
        self.container.addSubview(titleLabel)
        self.container.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.container.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.titleLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 32),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 48),
            self.tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            self.tableView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.container.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
