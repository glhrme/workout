//
//  CreateWorkoutViewModel.swift
//  workout
//
//  Created by Guilherme dos Santos on 27/04/23.
//

import Foundation
import UIKit
import CoreData

class CreateWorkoutViewModel {
    let stack: CoreDataStack
    let context: NSManagedObjectContext
    let workoutManager: WorkoutManager
    
    init() {
        stack = CoreDataStack(modelName: "Database")
        context = stack.persistentContainer.viewContext
        workoutManager = WorkoutManager(context: context)
    }
    
    func createWorkout(name: String, desc: String, finish: @escaping () -> Void) {
        let stack = CoreDataStack(modelName: "Database")
        let context = stack.persistentContainer.viewContext
        let workoutManager = WorkoutManager(context: context)
        
        let newWorkout = workoutManager.create(name: name, desc: desc)
        stack.saveContext()
        finish()
    }
}
