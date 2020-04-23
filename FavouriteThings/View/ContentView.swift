//
//  ContentView.swift
//  FavouriteThings
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI

/**
ContentView is bring in the MasterView in to be displayed.
*/

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            
            /// Bringing in MasterView contents
            MasterView(viewModel: viewModel)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation { self.viewModel.addFormulaOneDriver(formulaOneDriver: FormulaOneDriver(formulaOneDriverImage: "", formulaOneDriverName: "", formulaOneDriverTeam: "", formulaOneDriverChampionships: 0, formulaOneDriverNote: "")) }
                        }
                        
                    ) {
                    Image(systemName: "plus")
                    })
        }
    }
}
