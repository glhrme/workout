//
//  ExerciseManager.swift
//  workout
//
//  Created by Guilherme dos Santos on 26/04/23.
//

import CoreData

class ExerciseManager {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func create(name: String, notes: String?, image: String?, workout: Workout) -> Exercise? {
        let exercise = Exercise(context: context)
        exercise.name = name
        exercise.notes = notes ?? ""
        exercise.image = image ?? ""
        exercise.workout = workout
        exercise.id = UUID()
        return exercise
    }
    
    func fetchAll() -> [Exercise] {
        let fetchRequest: NSFetchRequest<Exercise> = Exercise.fetchRequest()
        do {
            let exercises = try context.fetch(fetchRequest)
            return exercises
        } catch {
            print("Failed to fetch exercises: \(error)")
            return []
        }
    }
    
    func delete(exercise: Exercise) {
        context.delete(exercise)
    }
}

