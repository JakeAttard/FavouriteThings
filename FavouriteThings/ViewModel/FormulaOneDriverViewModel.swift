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
    
    /// Left hand side TextField Placeholders
    
    /// Driver Name Label Placeholder Text variable for the TextField
    static var nameLabelPlaceholderText:  String = "Driver Name"
    
    /// Team Name Label Placeholder Text variable for the TextField
    static var teamNameLabelPlaceholderText:  String = "Team:"
    
    /// Nation Label Placeholder Text variable for the TextField
    static var nationLabelPlaceholderText:  String = "Nation:"
    
    /// Sponsor Label Placeholder Text variable for the TextField
    static var sponsorLabelPlaceholderText:  String = "Sponsor:"
    
    /// Notes Label Placeholder Text variable for the TextField
    static var notesLabelPlaceholderText:  String = "Notes:"

    /// Right hand side TextField Placeholders
    
    /// TeamName Placeholder Text variable for the TextField
    static var teamNamePlaceholderText:  String = "Add Driver Team"
    
    /// Nation Placeholder Text variable for the TextField
    static var nationPlaceholderText:  String = "Add Driver Nation"
    
    /// Sponsor Placeholder Text variable for the TextField
    static var sponsorPlaceholderText:  String = "Add Driver Sponsor"
    
    /// Notes Placeholder Text variable for the TextField
    static var notesPlaceholderText:  String = "Add Driver Notes"
    
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
    
    var nationString: String {
        get { nation ?? "" }
        set { nation = newValue }
    }
    
    var sponsorString: String {
        get { sponsor ?? "" }
        set { sponsor = newValue }
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
    
    var labelNation: String {
        get { nationLabel ?? "" }
        set { nationLabel = newValue }
    }
    
    var labelSponsor: String {
        get { sponsorLabel ?? "" }
        set { sponsorLabel = newValue }
    }
    
    var labelNotes: String {
        get { notesLabel ?? "" }
        set { notesLabel = newValue }
    }
}
