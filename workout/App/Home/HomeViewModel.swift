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
        stack = CoreDataStack.shared
        context = stack.persistentContainer.viewContext
        workoutManager = WorkoutManager(context: context)
    }
    
    func fetchAll() {
        let workouts = workoutManager.fetchAll()
        
        self.workouts.removeAll()
        
        workouts.forEach { work in
            self.workouts.append(work)
        }
    }
    
    func delete(item: Workout, finish: @escaping () -> Void) {
        workoutManager.delete(workout: item)
        fetchAll()
        finish()
    }
    
}
