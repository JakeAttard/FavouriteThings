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
    
    @Published var formulaOneDrivers: [FormulaOneDriver]
    
    /// ListTitle
    @Published var listTitle: String = "Formula One Drivers"
    
    
    /// Static placeholder text
    static var driverNamePlaceholder:  String = "Driver Name:"
    
    static var driverImageLabelPlaceholder: String = "Image URL"
    
    static var imageUrlPlaceholder: String = "Formula One Driver Profile URL"
    
    static var currentTeamPlaceholder: String = "Current Team:"
    
    static var titlesPlaceholder: String = "Driver Titles:"
    
    static var notesPlaceholder: String = "Driver Notes:"
    
    static var addNotes: String = "Add note..."
    
    /// Adding in a new Formula One Driver
    func addFormulaOneDriver(formulaOneDriver: FormulaOneDriver) {
        formulaOneDrivers.insert(formulaOneDriver, at: 0)
    }
    
    /// Removing a Formula One Driver
    func removeFormulaOneDriver(index: Int) {
        formulaOneDrivers.remove(at: index)
    }
    
    
    /// Need CodingKeys to Enocde and Decode the JSON Data
    enum CodingKeys: String, CodingKey {
        case formulaOneDrivers
        case listTitle
    }
    
    /**
    - Parameters:
       - formulaOneDrivers: FormulaOneDriver Array
    */
    
    init() {
        formulaOneDrivers = [FormulaOneDriver]()
    }
    
    /**
     Decoding the data from the CodingKeys
     - Parameter from: Decoder object used to decode the data
     */
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        formulaOneDrivers = try container.decode([FormulaOneDriver].self, forKey: .formulaOneDrivers)
        listTitle = try container.decode(String.self, forKey: .listTitle)
    }
    
    /**
    Encoding the data from the CodingKeys
    - Parameter to: Encoding object used to encode the data
    */
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(formulaOneDrivers, forKey: .formulaOneDrivers)
        try container.encode(listTitle, forKey: .listTitle)
    }
}
