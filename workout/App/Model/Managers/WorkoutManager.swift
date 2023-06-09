//
//  WorkoutManager.swift
//  workout
//
//  Created by Guilherme dos Santos on 26/04/23.
//

import CoreData

class WorkoutManager {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func create(name: String, desc: String) -> Workout? {
        let workout = Workout(context: context)
        workout.name = name
        workout.desc = desc
        workout.timestamp = Date()
        workout.id = UUID()
        return workout
    }
    
    func fetchAll() -> [Workout] {
        let fetchRequest: NSFetchRequest<Workout> = Workout.fetchRequest()
        do {
            let workouts = try context.fetch(fetchRequest)
            return workouts
        } catch {
            print("Failed to fetch workouts: \(error)")
            return []
        }
    }
    
    func fetch(id: UUID) -> Workout? {
        let fetchRequest: NSFetchRequest<Workout> = Workout.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", id as CVarArg)
            fetchRequest.predicate = predicate
        do {
            let workout = try context.fetch(fetchRequest)
            return workout.first
        } catch {
            print("Failed to fetch workout: \(error)")
            return nil
        }
    }
    
    func save() -> Bool {
        do {
            try context.save()
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func delete(workout: Workout) {
        context.delete(workout)
        save()
    }
}
