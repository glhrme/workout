//
//  ViewController.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import UIKit
import FirebaseAuthUI
import FirebaseOAuthUI

class LoginViewController: BaseViewController<LoginView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.loginButton.addTarget(self, action: #selector(self.didTapLoginButton(sender:)), for: .touchUpInside)
    }
}

extension LoginViewController {
    @objc func didTapLoginButton(sender: UIButton) {
        if let authUI = FUIAuth.defaultAuthUI(){
            authUI.providers = [FUIOAuth.appleAuthProvider()]
            authUI.delegate = self
            
            let controller = authUI.authViewController()
            self.present(controller, animated: true, completion: nil)
        }
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let user = authDataResult?.user {
            print(user.email ?? "private e-mail")
        }
    }
}
