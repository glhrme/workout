//
//  Workout.swift
//  workout
//
//  Created by Guilherme dos Santos on 25/04/23.
//

import Foundation
import CoreData

struct Workout: Hashable {
    let name: String
    let desc: String
    let timestamp: Date
    let id: String
    var exercises = Set<Exercise>()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(desc)
        hasher.combine(timestamp)
        hasher.combine(id)
        hasher.combine(exercises)
    }
    
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.name == rhs.name && lhs.desc == rhs.desc && lhs.timestamp == rhs.timestamp && lhs.id == rhs.id && lhs.exercises == rhs.exercises
    }
}

struct Exercise: Hashable {
    let name: String
    let notes: String
    let image: String
    var workout: Workout?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(notes)
        hasher.combine(image)
        hasher.combine(workout)
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name == rhs.name && lhs.notes == rhs.notes && lhs.image == rhs.image && lhs.workout == rhs.workout
    }
}
