//
//  LoginView.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import UIKit

class LoginView: BaseUIView {
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login Com Apple", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    lazy var image: UIImageView = {
        let view = UIImageView(image: .init(named: "HomeIcon"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var bottomContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
}

extension LoginView: ViewCode {
    func buildViewHierrachy() {
        self.addSubview(image)
        self.addSubview(bottomContainer)
        self.bottomContainer.addSubview(loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.image.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.image.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.image.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 41),
            self.image.heightAnchor.constraint(equalToConstant: 300),
            self.bottomContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.bottomContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.bottomContainer.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 60),
            self.bottomContainer.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.loginButton.bottomAnchor.constraint(equalTo: self.bottomContainer.bottomAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.bottomContainer.trailingAnchor),
            self.loginButton.leadingAnchor.constraint(equalTo: self.bottomContainer.leadingAnchor),
        ])
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
