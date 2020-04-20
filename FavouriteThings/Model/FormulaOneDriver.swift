//
//  FormulaOneDriver.swift
//  FavouriteThings
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI

/**
 FormulaOneDriver Class with key properties created to display a racing driver Formula One career stats these include driver:
 image (String), name (String), nationality (String), team (String), championships (Int), racestarts (Int), racewins (Int), podiums (Int), polepositions (Int), fatestlaps (Int), lapscompleted (Int) & career points (Float). A published variable has been created so users can add personal notes about their favourite drivers.
*/

class FormulaOneDriver: ObservableObject, Identifiable, Codable {
    
    /// Formula One Driver Image
    var formulaOneDriverImage: String
    
    /// Formula One Driver Name
    @Published var formulaOneDriverName: String
    
    /// Formula One Driver Nationality
    @Published var formulaOneDriverNationality: String
    
    /// Formula One Driver Team
    @Published var formulaOneDriverTeam: String
    
    /// Formula One Driver Championships
    @Published var formulaOneDriverChampionships: Int
    
    /// Formula One Driver Race Starts
    @Published var formulaOneDriverRaceStarts: Int
    
    /// Formula One Driver Race Wins
    @Published var formulaOneDriverRaceWins: Int
    
    /// Formula One Driver Podiums
    @Published var formulaOneDriverPodiums: Int
    
    /// Formula One Driver Pole Positions
    @Published var formulaOneDriverPolePositions: Int
    
    /// Formula One Driver Fastest Laps
    @Published var formulaOneDriverFastestLaps: Int
    
    /// Formula One Driver Laps Completed
    @Published var formulaOneDriverLapsCompleted: Int
    
    /// Formula One Driver Career Points
    @Published var formulaOneDriverCareerPoints: Int
    
    /// Formula One Driver Note
    @Published var formulaOneDriverNote: String = ""
    
    /// Formula One Driver Image
    @Published var formulaOneDriverUIImage: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case formulaOneDriverImage
        case formulaOneDriverName
        case formulaOneDriverNationality
        case formulaOneDriverTeam
        case formulaOneDriverChampionships
        case formulaOneDriverRaceStarts
        case formulaOneDriverRaceWins
        case formulaOneDriverPodiums
        case formulaOneDriverPolePositions
        case formulaOneDriverFastestLaps
        case formulaOneDriverLapsCompleted
        case formulaOneDriverCareerPoints
        case formulaOneDriverNote
    }
    
    /**
     - Parameters:
        - formulaOneDriverImage: The driver image (String)
        - formulaOneDriverName: The driver full name (String)
        - formulaOneDriverNationality: The driver nationality (String: what country he was born in)
        - formulaOneDriverDriverTeam: The driver team (String: what team he currently races for)
        - formulaOneDriverChampionships: The number of championships (Int) the driver has (Add 0 if none)
        - formulaOneDriverRaceStarts: The number of race starts (Int) the driver has (Add 0 if none)
        - formulaOneDriverRaceWins: The number of race wins (Int) the driver has (Add 0 if none)
        - formulaOneDriverPodiums: The number of podiums (Int)  the driver has  (Add 0 if none)
        - formulaOneDriverPolePositions: The number of pole positions (Int) the driver has  (Add 0 if none)
        - formulaOneDriverFastestLaps: The number of fatest laps (Int)  the driver has  (Add 0 if none)
        - formulaOneDriverLapsCompleted: The number of laps (Int)  the driver has completed (Add 0 if none)
        - formulaOneDriverCareerPoints: The number of career points (Float)  the driver has  (Add 0 if none)
     */
    
    init(formulaOneDriverImage: String, formulaOneDriverName: String, formulaOneDriverNationality: String, formulaOneDriverTeam: String, formulaOneDriverChampionships: Int, formulaOneDriverRaceStarts: Int, formulaOneDriverRaceWins: Int, formulaOneDriverPodiums: Int, formulaOneDriverPolePositions: Int, formulaOneDriverFastestLaps: Int, formulaOneDriverLapsCompleted: Int, formulaOneDriverCareerPoints: Int, formulaOneDriverNote: String) {
        
        self.formulaOneDriverImage = formulaOneDriverImage
        self.formulaOneDriverName = formulaOneDriverName
        self.formulaOneDriverNationality = formulaOneDriverNationality
        self.formulaOneDriverTeam = formulaOneDriverTeam
        self.formulaOneDriverChampionships = formulaOneDriverChampionships
        self.formulaOneDriverRaceStarts = formulaOneDriverRaceStarts
        self.formulaOneDriverRaceWins = formulaOneDriverRaceWins
        self.formulaOneDriverPodiums = formulaOneDriverPodiums
        self.formulaOneDriverPolePositions = formulaOneDriverPolePositions
        self.formulaOneDriverFastestLaps = formulaOneDriverFastestLaps
        self.formulaOneDriverLapsCompleted = formulaOneDriverLapsCompleted
        self.formulaOneDriverCareerPoints = formulaOneDriverCareerPoints
        self.formulaOneDriverNote = formulaOneDriverNote
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        formulaOneDriverImage = try container.decode(String.self, forKey: .formulaOneDriverImage)
        formulaOneDriverName = try container.decode(String.self, forKey: .formulaOneDriverName)
        formulaOneDriverNationality = try container.decode(String.self, forKey: .formulaOneDriverNationality)
        formulaOneDriverTeam = try container.decode(String.self, forKey: .formulaOneDriverTeam)
        formulaOneDriverChampionships = try container.decode(Int.self, forKey: .formulaOneDriverChampionships)
        formulaOneDriverRaceStarts = try container.decode(Int.self, forKey: .formulaOneDriverRaceStarts)
        formulaOneDriverRaceWins = try container.decode(Int.self, forKey: .formulaOneDriverRaceWins)
        formulaOneDriverPodiums = try container.decode(Int.self, forKey: .formulaOneDriverPodiums)
        formulaOneDriverPolePositions = try container.decode(Int.self, forKey: .formulaOneDriverPolePositions)
        formulaOneDriverFastestLaps = try container.decode(Int.self, forKey: .formulaOneDriverFastestLaps)
        formulaOneDriverLapsCompleted = try container.decode(Int.self, forKey: .formulaOneDriverLapsCompleted)
        formulaOneDriverCareerPoints = try container.decode(Int.self, forKey: .formulaOneDriverCareerPoints)
        formulaOneDriverNote = try container.decode(String.self, forKey: .formulaOneDriverNote)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(formulaOneDriverImage, forKey: .formulaOneDriverImage)
        try container.encode(formulaOneDriverName, forKey: .formulaOneDriverName)
        try container.encode(formulaOneDriverNationality, forKey: .formulaOneDriverNationality)
        try container.encode(formulaOneDriverTeam, forKey: .formulaOneDriverTeam)
        try container.encode(formulaOneDriverChampionships, forKey: .formulaOneDriverChampionships)
        try container.encode(formulaOneDriverRaceStarts, forKey: .formulaOneDriverRaceStarts)
        try container.encode(formulaOneDriverRaceWins, forKey: .formulaOneDriverRaceWins)
        try container.encode(formulaOneDriverPodiums, forKey: .formulaOneDriverPodiums)
        try container.encode(formulaOneDriverPolePositions, forKey: .formulaOneDriverPolePositions)
        try container.encode(formulaOneDriverFastestLaps, forKey: .formulaOneDriverFastestLaps)
        try container.encode(formulaOneDriverLapsCompleted, forKey: .formulaOneDriverLapsCompleted)
        try container.encode(formulaOneDriverCareerPoints, forKey: .formulaOneDriverCareerPoints)
        try container.encode(formulaOneDriverNote, forKey: .formulaOneDriverNote)
    }
    
    /// Updating a Formula One Driver Image by passing in a image URL
    func updateFormulaOneDriverImage(imageURL: String) {
        
        guard let url = URL(string: imageURL),
            let imageData = try? Data(contentsOf: url),
            let formulaOneDriverUIImage = UIImage(data: imageData) else {
                self.formulaOneDriverUIImage = nil
                return
        }
        
        self.formulaOneDriverUIImage = formulaOneDriverUIImage
    }
    
    /// Getting the new Formula One Driver Image and adding it to the view
    func getFormulaOneDriverImage() -> Image {
        if let formulaOneDriverUIImage = formulaOneDriverUIImage{
            return Image(uiImage: formulaOneDriverUIImage)
        } else {
            return Image(formulaOneDriverImage)
        }
    }
}
