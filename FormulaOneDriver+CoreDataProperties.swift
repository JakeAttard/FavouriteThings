//
//  FormulaOneDriver+CoreDataProperties.swift
//  FavouriteThings
//
//  Created by Jake Attard on 28/4/20.
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
    @NSManaged public var formulaOne: FormulaOne?

}
