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
    
    /// Empty imageURL String
    var imageURL = ""
    
    /// Formula One Driver Image
    @Published var formulaOneDriverImage: String
    
    /// Formula One Driver Name
    @Published var formulaOneDriverName: String
    
    /// Formula One Driver Team
    @Published var formulaOneDriverTeam: String
    
    /// Formula One Driver Championships
    @Published var formulaOneDriverChampionships: Int
    
    /// Formula One Driver Note
    @Published var formulaOneDriverNote: String = ""
    
    /// Formula One Driver Image
    @Published var formulaOneDriverUIImage: UIImage?
    
     /// Need CodingKeys to Enocde and Decode the JSON Data
    enum CodingKeys: String, CodingKey {
        case imageURL
        case formulaOneDriverImage
        case formulaOneDriverName
        case formulaOneDriverTeam
        case formulaOneDriverChampionships
        case formulaOneDriverNote
    }
    
    /**
     - Parameters:
        - formulaOneDriverImage: The driver image (String)
        - formulaOneDriverName: The driver full name (String)
        - formulaOneDriverDriverTeam: The driver team (String: what team he currently races for)
        - formulaOneDriverChampionships: The number of championships (Int) the driver has (Add 0 if none)
     */
    
    init(formulaOneDriverImage: String, formulaOneDriverName: String, formulaOneDriverTeam: String, formulaOneDriverChampionships: Int, formulaOneDriverNote: String) {
        
        self.formulaOneDriverImage = formulaOneDriverImage
        self.formulaOneDriverName = formulaOneDriverName
        self.formulaOneDriverTeam = formulaOneDriverTeam
        self.formulaOneDriverChampionships = formulaOneDriverChampionships
        self.formulaOneDriverNote = formulaOneDriverNote
    }
    
    /**
    Decoding the data from the CodingKeys
    - Parameter from: Decoder object used to decode the data
    */
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        formulaOneDriverImage = try container.decode(String.self, forKey: .formulaOneDriverImage)
        formulaOneDriverName = try container.decode(String.self, forKey: .formulaOneDriverName)
        formulaOneDriverTeam = try container.decode(String.self, forKey: .formulaOneDriverTeam)
        formulaOneDriverChampionships = try container.decode(Int.self, forKey: .formulaOneDriverChampionships)
        formulaOneDriverNote = try container.decode(String.self, forKey: .formulaOneDriverNote)
        updateFormulaOneDriverImage(imageURL: imageURL)
    }
    
    /**
    Encoding the data from the CodingKeys
    - Parameter to: Encoding object used to encode the data
    */
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(formulaOneDriverImage, forKey: .formulaOneDriverImage)
        try container.encode(formulaOneDriverImage, forKey: .formulaOneDriverImage)
        try container.encode(formulaOneDriverName, forKey: .formulaOneDriverName)
        try container.encode(formulaOneDriverTeam, forKey: .formulaOneDriverTeam)
        try container.encode(formulaOneDriverChampionships, forKey: .formulaOneDriverChampionships)
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
