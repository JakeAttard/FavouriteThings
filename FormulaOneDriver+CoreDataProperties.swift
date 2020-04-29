//
//  FormulaOneDriver+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Jake Attard on 29/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//
//

import Foundation
import CoreData


extension FormulaOneDriver {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FormulaOneDriver> {
        return NSFetchRequest<FormulaOneDriver>(entityName: "FormulaOneDriver")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var team: String?
    @NSManaged public var nation: String?
    @NSManaged public var title: Double?
    @NSManaged public var notes: String?
    @NSManaged public var imageLabel: String?
    @NSManaged public var teamLabel: String?
    @NSManaged public var nationLabel: String?
    @NSManaged public var titlesLabel: String?
    @NSManaged public var notesLabel: String?
    @NSManaged public var driver: FormulaOneDrivers?

}
