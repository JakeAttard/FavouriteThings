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

    /// fetching the request of FormulaOneDriver with entityName FormulaOneDriver
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FormulaOneDriver> {
        return NSFetchRequest<FormulaOneDriver>(entityName: "FormulaOneDriver")
    }

    /// name variable for the entity which is a String
    @NSManaged public var name: String?
    
    /// imageName variable for the entity which is a String
    @NSManaged public var imageName: String?
    
    /// imageURL variable for the entity which is a String
    @NSManaged public var imageURL: String?
    
    /// team variable for the entity which is a String
    @NSManaged public var team: String?
    
    /// nation variable for the entity which is a String
    @NSManaged public var nation: String?
    
    /// sponsor variable for the entity which is a String
    @NSManaged public var sponsor: String?
    
    /// notes variable for the entity which is a String
    @NSManaged public var notes: String?
    
    /// imageLabel variable for the entity which is a String
    @NSManaged public var imageLabel: String?
    
    /// teamLabel variable for the entity which is a String
    @NSManaged public var teamLabel: String?
    
    /// nationLabel variable for the entity which is a String
    @NSManaged public var nationLabel: String?
    
    /// sponsorLabel variable for the entity which is a String
    @NSManaged public var sponsorLabel: String?
    
    /// notesLabel variable for the entity which is a String
    @NSManaged public var notesLabel: String?
    
    @NSManaged public var locationName: String?
    
    @NSManaged public var latitude: Double?
    
    @NSManaged public var longitude: Double?
    
    /// variable driver which references the FormulaOneDrivers array
    @NSManaged public var driver: FormulaOneDrivers?

}
