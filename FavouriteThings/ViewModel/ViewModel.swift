//
//  ViewModel.swift
//  FavouriteThings
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

/**
 ViewModel is a model
*/

import Foundation

class ViewModel: ObservableObject, Identifiable, Codable {
    
    /// Static Text and Placeholder information
    @Published var formulaOneDrivers: [FormulaOneDriver]
    
    @Published var listTitle: String = "Formula One Drivers"
    
    @Published var driverName: String = "Driver Name:"
    
    static var driverNamePlaceholder:  String = "Driver Name:"
    
    @Published var driverImage: String = "Driver Image:"
    
    static var driverImageLabelPlaceholder: String = "Image URL"
    
    static var imageUrlPlaceholder: String = "Formula One Driver Profile URL"
    
    @Published var driverTeam: String = "Driver Team:"
    
    static var currentTeamPlaceholder: String = "Current Team:"
    
    @Published var driverTitles: String = "Titles:"
    
    static var titlesPlaceholder: String = "Titles:"
    
    @Published var driverNotes: String = "Notes:"
    
    static var notesPlaceholder: String = "Notes:"
    
    static var addNotes: String = "Add note..."
    
    /// Adding in a new Formula One Driver
    func addFormulaOneDriver() {
        formulaOneDrivers.insert(FormulaOneDriver(formulaOneDriverImage: "", formulaOneDriverName: "", formulaOneDriverTeam: "", formulaOneDriverChampionships: 0, formulaOneDriverNote: ""), at: 0)
    }
    
    /// Removing a Formula One Driver
    func removeFormulaOneDriver(index: Int) {
        formulaOneDrivers.remove(at: index)
    }
    
    enum CodingKeys: String, CodingKey {
        case formulaOneDrivers
        case listTitle
        case driverName
        case driverImage
        case driverTeam
        case driverTitles
        case driverNotes
    }
    
    /**
    - Parameters:
       - formulaOneDrivers: FormulaOneDriver Array
    */
    
    init() {
        formulaOneDrivers = [FormulaOneDriver]()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        formulaOneDrivers = try container.decode([FormulaOneDriver].self, forKey: .formulaOneDrivers)
        listTitle = try container.decode(String.self, forKey: .listTitle)
        driverName = try container.decode(String.self, forKey: .driverName)
        driverImage = try container.decode(String.self, forKey: .driverImage)
        driverTeam = try container.decode(String.self, forKey: .driverTeam)
        driverTitles = try container.decode(String.self, forKey: .driverTitles)
        driverNotes = try container.decode(String.self, forKey: .driverNotes)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(formulaOneDrivers, forKey: .formulaOneDrivers)
        try container.encode(listTitle, forKey: .listTitle)
        try container.encode(driverName, forKey: .driverName)
        try container.encode(driverImage, forKey: .driverImage)
        try container.encode(driverTeam, forKey: .driverTeam)
        try container.encode(driverTitles, forKey: .driverTitles)
        try container.encode(driverNotes, forKey: .driverNotes)
    }
}
