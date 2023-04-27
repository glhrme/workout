//
//  AddExerciseViewController.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit

class AddExerciseViewController: BaseViewController<AddExerciseView> {
    
    let viewModel: AddExerciseViewModel

    init(viewModel: AddExerciseViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.delegate = self
    }

}

extension AddExerciseViewController: AddExerciseViewDelegate {
    func addExercise(name: String, notes: String) {
        self.viewModel.createExercise(name: name, notes: notes) {
            self.viewModel.delegate?.update()
            self.dismiss(animated: true)
        }
    }
    
    func selectImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
}

extension AddExerciseViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        self.dismiss(animated: true, completion: nil)
        self.viewModel.image = image
        self.customView.exerciseImageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

