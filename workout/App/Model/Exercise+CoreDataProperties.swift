//
//  Exercise+CoreDataProperties.swift
//  workout
//
//  Created by Guilherme dos Santos on 26/04/23.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var notes: String?
    @NSManaged public var workout: Workout?

}

extension Exercise : Identifiable {

}
