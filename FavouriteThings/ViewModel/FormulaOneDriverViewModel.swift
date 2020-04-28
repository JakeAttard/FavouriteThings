//
//  FormulaOneDriverViewModel.swift
//  FavouriteThings
//
//  Created by Jake Attard on 28/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import CoreData
import Foundation


extension FormulaOneDriver {
    var nameString: String {
        get { name ?? "" }
        set { name = newValue }
    }
    
    var imageString: String {
        get { image ?? "" }
        set { image = newValue }
    }
    
    var teamString: String {
        get { team ?? "" }
        set { team = newValue }
    }
    
    var titlesInt: Double {
        get { titles }
        set { titles = newValue }
    }
    
    var notesString: String {
        get { notes ?? "" }
        set { notes = newValue }
    }
    
    var labelImage: String {
        get { imageLabel ?? "" }
        set { imageLabel = newValue }
    }
    
    var labelTeam: String {
        get { teamLabel ?? "" }
        set { teamLabel = newValue }
    }
    
    var labelTitle: String {
        get { titlesLabel ?? "" }
        set { titlesLabel = newValue }
    }
    
    var labelNotes: String {
        get { notesLabel ?? "" }
        set { notesLabel = newValue }
    }
}
