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
    
    func sortAlphabetically() {
        entries.sort()
    }
    
    func sortInReverseOrder() {
        entries.sort(by: (>))
    }
    
    func addNewFormulaOneDriver(context: NSManagedObjectContext) {
        
        /// Adding a new FormulaOneDriver
        let formulaOneDriver = FormulaOneDriver(context: context)
        
        /// Setting the new FormulaOneDriver
        formulaOneDriver.formulaOneDriver = self
        
        self.saveFormulaOneDriver()
    }
    
    func saveFormulaOneDriver() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No App Delegate")
        }
        
        appDelegate.saveContext()
    }
}
