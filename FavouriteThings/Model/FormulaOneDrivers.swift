//
//  FormulaOneDrivers.swift
//  FavouriteThings
//
//  Created by Jake Attard on 20/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import Foundation

class FormulaOneDrivers: ObservableObject, Identifiable, Codable {
    @Published var formulaOneDrivers = [FormulaOneDriver]()
    
    init() {
        
    }
    
    required init(from decoder: Decoder) throws {
    }
    
    func encode(to encoder: Encoder) throws {
    }
}
