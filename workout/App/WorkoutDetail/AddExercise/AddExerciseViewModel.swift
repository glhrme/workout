//
//  AddExerciseViewModel.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import UIKit
import CoreData
import FirebaseStorage

protocol AddExerciseViewModelDelegate: AnyObject {
    func update() -> Void
}

class AddExerciseViewModel {
    var image: UIImage?
    
    var workout: Workout
    
    let stack: CoreDataStack
    let context: NSManagedObjectContext
    let workoutManager: WorkoutManager
    let exerciseManager: ExerciseManager
    
    weak var delegate: AddExerciseViewModelDelegate?
    
    init(workout: Workout) {
        self.workout = workout
        stack = CoreDataStack.shared
        context = stack.persistentContainer.viewContext
        workoutManager = WorkoutManager(context: context)
        exerciseManager = ExerciseManager(context: context)
        self.getWorkoutContext()
    }
    
    private func getWorkoutContext() {
        guard let id = workout.id else { return }
        guard let workout = self.workoutManager.fetch(id: id) else { return }
        self.workout = workout
    }
    
    func createExercise(name: String, notes: String, completion: @escaping () -> Void) {
        self.uploadImage { result in
            switch result {
            case .success(let success):
                guard let exercise = self.exerciseManager.create(name: name, notes: notes, image: success.absoluteString, workout: self.workout) else { return }
                self.workout.exercises?.insert(exercise)
                self.stack.saveContext()
                completion()
            case .failure:
                fatalError("Erro no upload")
            }
        }
    }
    
    func uploadImage(completion: @escaping (Result<URL, Error>) -> Void) {
        guard let image = image else {
            completion(.failure(NSError(domain: "AddExerciseViewModel", code: -1, userInfo: [NSLocalizedDescriptionKey: "No image to upload"])))
            return
        }
        
        let storageRef = Storage.storage().reference()
        let imageRef = storageRef.child("images/\(UUID().uuidString).jpg")
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(.failure(NSError(domain: "AddExerciseViewModel", code: -2, userInfo: [NSLocalizedDescriptionKey: "Failed to get image data"])))
            return
        }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        imageRef.putData(imageData, metadata: metadata) { metadata, error in
            if let error = error {
                completion(.failure(error))
            } else {
                imageRef.downloadURL { url, error in
                    if let error = error {
                        completion(.failure(error))
                    } else if let url = url {
                        completion(.success(url))
                    } else {
                        completion(.failure(NSError(domain: "AddExerciseViewModel", code: -3, userInfo: [NSLocalizedDescriptionKey: "Failed to get download URL"])))
                    }
                }
            }
        }
    }
}

