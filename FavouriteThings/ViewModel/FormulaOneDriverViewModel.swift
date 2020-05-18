//
//  FormulaOneDriverViewModel.swift
//  FavouriteThings
//
//  Created by Jake Attard on 28/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import CoreData
import SwiftUI
import CoreLocation
import MapKit

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
    
    /// Location Name Text
    static var locationNameText: String = "Location Name:"
    
    /// Location Name TextField
    static var locationNameTextField: String = "Enter Location Name"
    
    /// Latitude Text
    static var latitudeText: String = "Latitude:"
    
    /// Latitude TextField
    static var latitudeTextField: String = "Enter latitude"
    
    /// Longitude Text
    static var longitudeText: String = "Longitude:"
    
    /// Latitude TextField
    static var longitudeTextField: String = "Enter longitude"
    
    /// Button Update Location Name
    static var updateLocationNameBtn: String = "Update Location Name"
    
    /// variable nameString getting the name value from CoreData to the variable
    var nameString: String {
        get { name ?? "" }
        set {
            name = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable imageString getting the imageName value from CoreData to the variable
    var imageString: String {
        get { imageName ?? "" }
        set {
            imageName = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable imageURLString getting the imageURL value from CoreData to the variable
    var imageURLString: String {
        get { imageURL ?? "" }
        set {
            imageURL = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable teamString  getting the team value from CoreData to the variable
    var teamString: String {
        get { team ?? "" }
        set {
            team = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable nationString  getting the nation value from CoreData to the variable
    var nationString: String {
        get { nation ?? "" }
        set {
            nation = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable sponsorString  getting the sponsor value from CoreData to the variable
    var sponsorString: String {
        get { sponsor ?? "" }
        set {
            sponsor = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable notesString  getting the notes value from CoreData to the variable
    var notesString: String {
        get { notes ?? "" }
        set {
            notes = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// Labels
    /// variable labelImage  getting the imageLabel value from CoreData to the variable
    var labelImage: String {
        get { imageLabel ?? "" }
        set {
            imageLabel = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable labelTeam  getting the teamLabel value from CoreData to the variable
    var labelTeam: String {
        get { teamLabel ?? "" }
        set {
            teamLabel = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable labelNation getting the nationLabel value from CoreData to the variable
    var labelNation: String {
        get { nationLabel ?? "" }
        set {
            nationLabel = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable labelSponsor  getting the sponsorLabel value from CoreData to the variable
    var labelSponsor: String {
        get { sponsorLabel ?? "" }
        set {
            sponsorLabel = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
    }
    
    /// variable labelNotes  getting the notesLabel value from CoreData to the variable
    var labelNotes: String {
        get { notesLabel ?? "" }
        set {
            notesLabel = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
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
    
    /// variable formulaOneDriverLocationName getting the locationName value from CoreData to the variable
    var formulaOneDriverLocationName: String {
        set {
            locationName = newValue
            formulaOneDriver?.saveFormulaOneDriver()
        }
        get { locationName ?? "" }
    }
    
    /// variable formulaOneDriverLatitude getting the latitude value from CoreData to the variable
    var formulaOneDriverLatitude: String {
        set {
            latitude = Double(newValue) ?? 0.0
            formulaOneDriver?.saveFormulaOneDriver()
        }
        get { "\(latitude)" }
    }
    
    /// variable formulaOneDriverLongitude getting the longitude value from CoreData to the variable
    var formulaOneDriverLongitude: String {
        set {
            longitude = Double(newValue) ?? 0.0
            formulaOneDriver?.saveFormulaOneDriver()
        }
        
        get { "\(longitude)" }
    }
    
}

/// Extension of FormulaOneDriver
extension FormulaOneDriver: Comparable {
    
    /// func used to sort out entries to display them (A-Z), (Z-A)
    public static func < (lhs: FormulaOneDriver, rhs: FormulaOneDriver) -> Bool {
        lhs.nameString < rhs.nameString
    }
}
