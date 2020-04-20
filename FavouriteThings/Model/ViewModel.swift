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
    
    static var driveName: String = "Name:"
    
    static var driverNamePlaceholder: String = "Driver Name"
    
    static var image: String = "Image URL:"
    
    static var imageUrlPlaceholder: String = "Formula One Driver Profile URL"
    
    static var country: String = "Country:"
    
    static var countryPlaceholder: String = "Add Country"
    
    static var currentTeam: String = "Current Team:"
    
    static var currentTeamPlaceholder: String = "Add Current Team:"
    
    static var titles: String = "Titles:"
    
    static var titlesPlaceholder: String = "Number of Titles Won"
    
    static var raceWins: String = "Race Wins:"
    
    static var raceWinsPlaceholder: String = "Number of Races Won"
    
    static var podiums: String = "Podiums:"
    
    static var podiumsPlaceholder: String = "Number of Podiums"
    
    static var polePositions: String = "Pole Positions:"
    
    static var polePositionsPlaceholder: String = "Number of Poles"
    
    static var raceStarts: String = "Race Starts:"
    
    static var raceStartsPlaceholder: String = "Number of Race Starts"
    
    static var fastestLaps: String = "Fastest Laps:"
    
    static var fastestLapsPlaceholder: String = "Number of Fastest Laps"
    
    static var lapsCompleted: String = "Laps Finished:"
    
    static var lapsCompletedPlaceholder: String = "Number of Laps Completed"
    
    static var careerPoints: String = "Career Points:"
    
    static var careerPointsPlaceholder: String = "Number of Career Points"
    
    static var notes: String = "Notes:"
    
    static var addNotes: String = "Add note..."
    
    static var disclaimer: String = "Disclaimer: Images taken from formula1.com website."
    
    /// Adding in a new Formula One Driver
    func addFormulaOneDriver() {
        formulaOneDrivers.insert(FormulaOneDriver(formulaOneDriverImage: "", formulaOneDriverName: "", formulaOneDriverNationality: "", formulaOneDriverTeam: "", formulaOneDriverChampionships: 0, formulaOneDriverRaceStarts: 0, formulaOneDriverRaceWins: 0, formulaOneDriverPodiums: 0, formulaOneDriverPolePositions: 0, formulaOneDriverFastestLaps: 0, formulaOneDriverLapsCompleted: 0, formulaOneDriverCareerPoints: 0, formulaOneDriverNote: ""), at: 0)
    }
    
    /// Removing a Formula One Driver
    func removeFormulaOneDriver(index: Int) {
        formulaOneDrivers.remove(at: index)
    }
    
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        formulaOneDrivers = try container.decode([FormulaOneDriver].self, forKey: .formulaOneDrivers)
        listTitle = try container.decode(String.self, forKey: .listTitle)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(formulaOneDrivers, forKey: .formulaOneDrivers)
        try container.encode(listTitle, forKey: .listTitle)
    }
}
