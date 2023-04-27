//
//  CreateWorkoutViewController.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

class CreateWorkoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func action(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
