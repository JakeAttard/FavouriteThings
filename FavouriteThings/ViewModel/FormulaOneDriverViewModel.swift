//
//  FormulaOneDriverViewModel.swift
//  FavouriteThings
//
//  Created by Jake Attard on 28/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import CoreData
import SwiftUI

/// Entension of FormulaOneDriver
extension FormulaOneDriver {
    
    /// Left hand side TextField Placeholders
    
    /// Driver Name Label Placeholder Text variable for the TextField
    static var nameLabelPlaceholderText:  String = "Driver Name"
    
    /// Image Placeholder Text variable for the TextField
    static var imageLabelPlaceholderText: String =  "Image:"
    
    /// Team Name Label Placeholder Text variable for the TextField
    static var teamNameLabelPlaceholderText:  String = "Team:"
    
    /// Nation Label Placeholder Text variable for the TextField
    static var nationLabelPlaceholderText:  String = "Nation:"
    
    /// Sponsor Label Placeholder Text variable for the TextField
    static var sponsorLabelPlaceholderText:  String = "Sponsor:"
    
    /// Notes Label Placeholder Text variable for the TextField
    static var notesLabelPlaceholderText:  String = "Notes:"

    /// Right hand side TextField Placeholders
    ///
    /// Image Placeholder Text variable for the TextField
    static var imagePlaceholderText: String =  "Add URL Image"
    
    /// TeamName Placeholder Text variable for the TextField
    static var teamNamePlaceholderText:  String = "Add Driver Team"
    
    /// Nation Placeholder Text variable for the TextField
    static var nationPlaceholderText:  String = "Add Driver Nation"
    
    /// Sponsor Placeholder Text variable for the TextField
    static var sponsorPlaceholderText:  String = "Add Driver Sponsor"
    
    /// Notes Placeholder Text variable for the TextField
    static var notesPlaceholderText:  String = "Add Driver Notes"
    
    /// List Title Placeholder Text
    static var listTitlePlaceholderText: String = "Formula One Drivers"
    
    /// variable nameString getting the name value from CoreData to the variable
    var nameString: String {
        get { name ?? "" }
        set { name = newValue }
    }
    
    /// variable imageString getting the imageName value from CoreData to the variable
    var imageString: String {
        get { imageName ?? "" }
        set { imageName = newValue }
    }
    
    /// variable imageURLString getting the imageURL value from CoreData to the variable
    var imageURLString: String {
        get { imageURL ?? "" }
        set { imageURL = newValue }
    }
    
    /// variable teamString  getting the team value from CoreData to the variable
    var teamString: String {
        get { team ?? "" }
        set { team = newValue }
    }
    
    /// variable nationString  getting the nation value from CoreData to the variable
    var nationString: String {
        get { nation ?? "" }
        set { nation = newValue }
    }
    
    /// variable sponsorString  getting the sponsor value from CoreData to the variable
    var sponsorString: String {
        get { sponsor ?? "" }
        set { sponsor = newValue }
    }
    
    /// variable notesString  getting the notes value from CoreData to the variable
    var notesString: String {
        get { notes ?? "" }
        set { notes = newValue }
    }
    
    /// Labels
    /// variable labelImage  getting the imageLabel value from CoreData to the variable
    var labelImage: String {
        get { imageLabel ?? "" }
        set { imageLabel = newValue }
    }
    
    /// variable labelTeam  getting the teamLabel value from CoreData to the variable
    var labelTeam: String {
        get { teamLabel ?? "" }
        set { teamLabel = newValue }
    }
    
    /// variable labelNation getting the nationLabel value from CoreData to the variable
    var labelNation: String {
        get { nationLabel ?? "" }
        set { nationLabel = newValue }
    }
    
    /// variable labelSponsor  getting the sponsorLabel value from CoreData to the variable
    var labelSponsor: String {
        get { sponsorLabel ?? "" }
        set { sponsorLabel = newValue }
    }
    
    /// variable labelNotes  getting the notesLabel value from CoreData to the variable
    var labelNotes: String {
        get { notesLabel ?? "" }
        set { notesLabel = newValue }
    }
    
    /// updateImage function and returning the Image
    func updateImage() -> Image {
        guard let imageURL = imageURL,
            let url = URL(string: imageURL),
            let imageData = try? Data(contentsOf: url),
            let uiImage = UIImage(data: imageData) else {
                return Image(imageName ?? "")
            }
        return Image(uiImage: uiImage)
    }
}

extension FormulaOneDriver: Comparable {
    public static func < (lhs: FormulaOneDriver, rhs: FormulaOneDriver) -> Bool {
        lhs.nameString < rhs.nameString
    }
}
