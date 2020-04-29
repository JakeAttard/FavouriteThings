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
    
    static var nameLabelPlaceholderText:  String = "Driver Name"
    static var teamNameLabelPlaceholderText:  String = "Team:"
    static var nationLabelPlaceholderText:  String = "Nation:"
    static var sponsorLabelPlaceholderText:  String = "Sponsor:"
    static var notesLabelPlaceholderText:  String = "Notes:"

    
    static var teamNamePlaceholderText:  String = "Add Driver Team"
    static var nationPlaceholderText:  String = "Add Driver Nation"
    static var sponsorPlaceholderText:  String = "Add Driver Sponsor"
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
