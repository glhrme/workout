//
//  HomeView.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit

protocol HomeViewDelegate: AnyObject {
    func goToCreate() -> Void
}

class HomeView: BaseUIView {
    
    weak var delegate: HomeViewDelegate?
    
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
        return table
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Criar treino", for: .normal)
        button.titleLabel?.font = .usePoppins(.semiBold, size: 20)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(goToCreate), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    func setup(delegate: UITableViewDelegate, dataSource: UITableViewDataSource, viewDelegate: HomeViewDelegate) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
        self.delegate = viewDelegate
        self.tableView.reloadData()
    }
    
    @objc func goToCreate() {
        self.delegate?.goToCreate()
    }
}

extension HomeView: ViewCode {
    func buildViewHierrachy() {
        self.addSubview(container)
        self.container.addSubview(titleLabel)
        self.container.addSubview(tableView)
        self.container.addSubview(createButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.container.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.container.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.container.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.container.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.titleLabel.topAnchor.constraint(equalTo: self.container.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 48),
            self.tableView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            self.tableView.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.createButton.heightAnchor.constraint(equalToConstant: 50),
            self.createButton.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 16),
            self.createButton.bottomAnchor.constraint(equalTo: self.container.bottomAnchor),
            self.createButton.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.createButton.trailingAnchor.constraint(equalTo: self.container.trailingAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
