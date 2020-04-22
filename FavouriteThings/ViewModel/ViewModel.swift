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
    
    @Published var driverName: String = "Driver Name"
    
    static var driverNamePlaceholder:  String = "Driver Name"
    
    @Published var driverImage: String = "Driver Image"
    
    static var driverImageLabelPlaceholder: String = "Image URL"
    
    static var imageUrlPlaceholder: String = "Formula One Driver Profile URL"
    
    static var currentTeam: String = "Current Team:"
    
    static var currentTeamPlaceholder: String = "Add Current Team:"
    
    static var titles: String = "Titles:"
    
    static var titlesPlaceholder: String = "Number of Titles Won"
    
    
    static var notes: String = "Notes:"
    
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
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(formulaOneDrivers, forKey: .formulaOneDrivers)
        try container.encode(listTitle, forKey: .listTitle)
        try container.encode(driverName, forKey: .driverName)
        try container.encode(driverImage, forKey: .driverImage)
    }
}
