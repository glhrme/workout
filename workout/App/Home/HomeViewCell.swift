//
//  HomeViewCell.swift
//  workout
//
//  Created by Guilherme dos Santos on 26/04/23.
//

import UIKit

class HomeViewCell: UITableViewCell {
    static let identifier = "homeViewCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.usePoppins(.regular, size: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.usePoppins(.medium, size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup(title: String, desc: String) {
        self.titleLabel.text = title
        self.descLabel.text = desc
        
        self.backgroundColor = .white
        
        [titleLabel, descLabel].forEach { self.contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            self.contentView.heightAnchor.constraint(equalToConstant: 100),
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8), //Use a âncora superior da contentView
            self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 40),
            self.descLabel.heightAnchor.constraint(equalToConstant: 40),
            self.descLabel.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            self.descLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            self.descLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8), //Use a âncora inferior da contentView
        ])
    }

    
}
