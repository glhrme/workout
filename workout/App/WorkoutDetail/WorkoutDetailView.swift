//
//  WorkoutDetailView.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

protocol WorkoutDetailViewDelegate: AnyObject {
    func addExercise() -> Void
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
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Adicionar Exercício", for: .normal)
        button.titleLabel?.font = .usePoppins(.semiBold, size: 20)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(addExercise), for: .touchUpInside)
        return button
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
    
    @objc func addExercise() {
        self.delegate?.addExercise()
    }
}

extension WorkoutDetailView: ViewCode {
    func buildViewHierrachy() {
        [titleLabel, descLabel, addButton, tableView].forEach { self.addSubview($0) }
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
            
            addButton.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 16),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
