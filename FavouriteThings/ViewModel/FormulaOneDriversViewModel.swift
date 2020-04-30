//
//  FormulaOneViewModel.swift
//  FavouriteThings
//
//  Created by Jake Attard on 28/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import CoreData
import Foundation

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
}
