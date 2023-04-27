//
//  WorkoutDetailViewModel.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import Foundation
import CoreData

class WorkoutDetailViewModel {
    var workout: Workout
    
    let stack: CoreDataStack
    let context: NSManagedObjectContext
    let workoutManager: WorkoutManager
    
    init(workout: Workout) {
        self.workout = workout
        stack = CoreDataStack.shared
        context = stack.persistentContainer.viewContext
        workoutManager = WorkoutManager(context: context)
    }
    
    func fetch(completion: @escaping () -> Void) {
        guard let id = self.workout.id else { return }
        guard let workout = workoutManager.fetch(id: id) else { return }
        
        self.workout = workout
        completion()
    }
}
