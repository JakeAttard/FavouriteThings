//
//  FormulaOne+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Jake Attard on 28/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//
//

import Foundation
import CoreData


extension FormulaOne {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FormulaOne> {
        return NSFetchRequest<FormulaOne>(entityName: "FormulaOne")
    }

    @NSManaged public var title: String?
    @NSManaged public var drivers: NSOrderedSet?

}

// MARK: Generated accessors for drivers
extension FormulaOne {

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
