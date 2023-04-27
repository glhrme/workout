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
    
    func createWorkout() {
        let stack = CoreDataStack(modelName: "Database")
        let context = stack.persistentContainer.viewContext
        let workout = WorkoutManager(context: context)
        
        let newWorkout = workout.create(name: "A", desc: "Peito")
        stack.saveContext()
        
        let workouts = workout.fetchAll()
        
        workouts.forEach { work in
            self.workouts.append(work)
        }
    }
    
}
