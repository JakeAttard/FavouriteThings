//
//  FormulaOneViewModel.swift
//  FavouriteThings
//
//  Created by Jake Attard on 28/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import CoreData
import SwiftUI

/// Entension of FormulaOneDrivers
extension FormulaOneDrivers {
    
    /// Creating variable called entries which takes the FormulaOneDriver Array
    var entries: [FormulaOneDriver] {
        set {formulaOneDrivers = NSOrderedSet(array: newValue)}
        get {(formulaOneDrivers?.array as? [FormulaOneDriver]) ?? []}
    }
    
    /// variable title  getting the listTitle value from CoreData to the variable
    var title: String {
        set(newTitle) { self.listTitle = newTitle }
        get { listTitle ?? "" }
    }
    
    /// Sorting the entries alphabetically (A-Z)
    func sortAlphabetically() {
        entries.sort()
    }
    
    /// Sorting the entries in reverseOrder (Z-A)
    func sortInReverseOrder() {
        entries.sort(by: (>))
    }
    
    /// Adding New formulaOneDriver
    func addNewFormulaOneDriver(context: NSManagedObjectContext) {
        
        /// Adding a new FormulaOneDriver
        let formulaOneDriver = FormulaOneDriver(context: context)
        
        /// Setting the new FormulaOneDriver
        formulaOneDriver.formulaOneDriver = self
        
        /// Saving the new formulaOneDriver
        self.saveFormulaOneDriver()
    }
    
    /// savingFormulaOneDriver function to use in the addNewFormulaOneDriver function
    func saveFormulaOneDriver() {
        /// Calling the AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No App Delegate")
        }
        
        /// Saving the Context
        appDelegate.saveContext()
    }
}
