//
//  CreateWorkoutView.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

protocol CreateWorkoutViewDelegate: AnyObject {
    func createWorkout(name: String, desc: String) -> Void
}

class CreateWorkoutView: BaseUIView {
    
    weak var delegate: CreateWorkoutViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Treino"
        label.font = .usePoppins(.semiBold, size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    lazy var nameField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.attributedPlaceholder = NSAttributedString(string: "Nome do Treino", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.font = .usePoppins(.regular, size: 14)
        field.textColor = .black
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.leftView = UIView(frame: CGRectMake(0, 0, 15, 40))
        field.leftViewMode = .always
        field.layer.cornerRadius = 8
        return field
    }()
    
    lazy var descField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.attributedPlaceholder = NSAttributedString(string: "Descrição do Treino", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        field.font = .usePoppins(.regular, size: 14)
        field.textColor = .black
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.leftView = UIView(frame: CGRectMake(0, 0, 15, 40))
        field.leftViewMode = .always
        field.layer.cornerRadius = 8
        return field
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Criar", for: .normal)
        button.titleLabel?.font = .usePoppins(.semiBold, size: 20)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(createWorkout), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    @objc func createWorkout() {
        guard let name = nameField.text, let desc = descField.text else { return }
        self.delegate?.createWorkout(name: name, desc: desc)
    }
    
}

extension CreateWorkoutView: ViewCode {
    func buildViewHierrachy() {
        [titleLabel, nameField, descField, createButton].forEach { self.addSubview($0) }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            nameField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            nameField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nameField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            nameField.heightAnchor.constraint(equalToConstant: 40),
            descField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 8),
            descField.leadingAnchor.constraint(equalTo: nameField.leadingAnchor),
            descField.trailingAnchor.constraint(equalTo: nameField.trailingAnchor),
            descField.heightAnchor.constraint(equalToConstant: 40),
            createButton.topAnchor.constraint(equalTo: descField.bottomAnchor, constant: 32),
            createButton.leadingAnchor.constraint(equalTo: descField.leadingAnchor),
            createButton.trailingAnchor.constraint(equalTo: descField.trailingAnchor),
            createButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
