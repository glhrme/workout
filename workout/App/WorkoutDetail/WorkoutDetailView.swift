//
//  WorkoutDetailView.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

protocol WorkoutDetailViewDelegate: AnyObject {

}

class WorkoutDetailView: BaseUIView {
    weak var delegate: WorkoutDetailViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .usePoppins(.bold, size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .usePoppins(.regular, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(WorkoutTableViewCell.self, forCellReuseIdentifier: WorkoutTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    func setup(name: String, desc: String, delegate: UITableViewDelegate, dataSource: UITableViewDataSource, viewDelegate: WorkoutDetailViewDelegate) {
        self.titleLabel.text = name
        self.descLabel.text = desc
        
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
        self.delegate = viewDelegate
        self.tableView.reloadData()
    }
}

extension WorkoutDetailView: ViewCode {
    func buildViewHierrachy() {
        [titleLabel, descLabel, tableView].forEach { self.addSubview($0) }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 48),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
