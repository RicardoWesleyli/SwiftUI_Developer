//
//  Goal+CoreDataProperties.swift
//  Chapter14
//
//  Created by Ricardo Li on 2023/9/15.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var currentProgress: Int
    @NSManaged public var goalText: String
    @NSManaged public var id: UUID
    @NSManaged public var targetDate: Date

}

extension Goal : Identifiable {

}
