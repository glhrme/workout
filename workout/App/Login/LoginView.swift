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
        button.backgroundColor = UIColor.red
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupView()
    }
}

extension LoginView: ViewCode {
    func buildViewHierrachy() {
        self.addSubview(loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.loginButton.widthAnchor.constraint(equalToConstant: 200),
            self.loginButton.heightAnchor.constraint(equalToConstant: 45),
            self.loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
