//
//  HomeViewModel.swift
//  workout
//
//  Created by Guilherme dos Santos on 26/04/23.
//

import Foundation
import UIKit
import CoreData

class HomeViewModel {
    
    var workouts: Array<Workout> = []
    
    let stack: CoreDataStack
    let context: NSManagedObjectContext
    let workoutManager: WorkoutManager
    
    init() {
        stack = CoreDataStack(modelName: "Database")
        context = stack.persistentContainer.viewContext
        workoutManager = WorkoutManager(context: context)
    }
    
    func fetchAll() {
        let workouts = workoutManager.fetchAll()
        
        workouts.forEach { work in
            self.workouts.append(work)
        }
    }
    
    func createWorkout() {
        let stack = CoreDataStack(modelName: "Database")
        let context = stack.persistentContainer.viewContext
        let workoutManager = WorkoutManager(context: context)
        
        let newWorkout = workoutManager.create(name: "A", desc: "Peito")
        stack.saveContext()
        
        let workouts = workoutManager.fetchAll()
        
        workouts.forEach { work in
            self.workouts.append(work)
        }
    }
    
}
