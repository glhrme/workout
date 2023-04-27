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
    
    func save() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        let workoutEntity = NSEntityDescription.entity(forEntityName: "Workout", in: managedContext)!
        let workout = WorkoutModel(entity: workoutEntity, insertInto: managedContext)
    }

}
