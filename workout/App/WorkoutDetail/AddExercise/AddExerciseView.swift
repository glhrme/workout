//
//  AddExerciseView.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

protocol AddExerciseViewDelegate: AnyObject {
    func addExercise(name: String, notes: String) -> Void
    func selectImage() -> Void
}

class AddExerciseView: BaseUIView {
    weak var delegate: AddExerciseViewDelegate?
    
    lazy var exerciseImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "plus")
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImage)))
        return view
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome"
        textField.font = .usePoppins(.bold, size: 14)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var notesTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Anotações"
        textField.font = .usePoppins(.bold, size: 14)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .customBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Salvar", for: .normal)
        button.titleLabel?.font = .usePoppins(.semiBold, size: 20)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(addExercise), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
    
    @objc func addExercise() {
        guard let name = nameTextField.text, let notes = notesTextField.text else { return }
        self.delegate?.addExercise(name: name, notes: notes)
    }
    
    @objc func selectImage() {
        self.delegate?.selectImage()
    }
}

extension AddExerciseView: ViewCode {
    func buildViewHierrachy() {
        self.addSubview(exerciseImageView)
        self.addSubview(nameTextField)
        self.addSubview(notesTextField)
        self.addSubview(saveButton)
    }
    
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            exerciseImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            exerciseImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            exerciseImageView.widthAnchor.constraint(equalToConstant: 120),
            exerciseImageView.heightAnchor.constraint(equalToConstant: 120),
            
            nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: exerciseImageView.trailingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            notesTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            notesTextField.leadingAnchor.constraint(equalTo: exerciseImageView.trailingAnchor, constant: 16),
            notesTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            notesTextField.heightAnchor.constraint(equalToConstant: 40),
            
            saveButton.topAnchor.constraint(equalTo: notesTextField.bottomAnchor, constant: 16),
            saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
