//
//  WorkoutTableViewCell.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    static let identifier = "workoutTableViewCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.usePoppins(.regular, size: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var notesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.usePoppins(.medium, size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "multiply.square.fill")
        return view
    }()
    
    func setup(title: String, notes: String, imageUrl: String) {
        self.titleLabel.text = title
        self.notesLabel.text = notes
        
        self.backgroundColor = .white
        
        self.viewImage.load(url: .init(string: imageUrl)!)
        
        [titleLabel, notesLabel, viewImage].forEach { self.contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            viewImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            viewImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            viewImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            viewImage.widthAnchor.constraint(equalToConstant: 60),
            viewImage.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: viewImage.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: notesLabel.topAnchor, constant: -4),

            notesLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: 16),
            notesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            notesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }

    
}
