//
//  FormulaOneDrivers+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Jake Attard on 29/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//
//

import Foundation
import CoreData


extension FormulaOneDrivers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FormulaOneDrivers> {
        return NSFetchRequest<FormulaOneDrivers>(entityName: "FormulaOneDrivers")
    }

    @NSManaged public var listTitle: String?
    @NSManaged public var drivers: NSOrderedSet?

}

// MARK: Generated accessors for drivers
extension FormulaOneDrivers {

    @objc(insertObject:inDriversAtIndex:)
    @NSManaged public func insertIntoDrivers(_ value: FormulaOneDriver, at idx: Int)

    @objc(removeObjectFromDriversAtIndex:)
    @NSManaged public func removeFromDrivers(at idx: Int)

    @objc(insertDrivers:atIndexes:)
    @NSManaged public func insertIntoDrivers(_ values: [FormulaOneDriver], at indexes: NSIndexSet)

    @objc(removeDriversAtIndexes:)
    @NSManaged public func removeFromDrivers(at indexes: NSIndexSet)

    @objc(replaceObjectInDriversAtIndex:withObject:)
    @NSManaged public func replaceDrivers(at idx: Int, with value: FormulaOneDriver)

    @objc(replaceDriversAtIndexes:withDrivers:)
    @NSManaged public func replaceDrivers(at indexes: NSIndexSet, with values: [FormulaOneDriver])

    @objc(addDriversObject:)
    @NSManaged public func addToDrivers(_ value: FormulaOneDriver)

    @objc(removeDriversObject:)
    @NSManaged public func removeFromDrivers(_ value: FormulaOneDriver)

    @objc(addDrivers:)
    @NSManaged public func addToDrivers(_ values: NSOrderedSet)

    @objc(removeDrivers:)
    @NSManaged public func removeFromDrivers(_ values: NSOrderedSet)

}
