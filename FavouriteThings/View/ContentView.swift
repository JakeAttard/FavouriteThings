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
    /// Getting the context from the @Environment managedObjectContext
    @Environment(\.managedObjectContext) var context
    
    /// FetchRequest of the FormulaOneDrivers and listTitle
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FormulaOneDrivers.listTitle, ascending: true)]) var formulaOneDrivers: FetchedResults<FormulaOneDrivers>
    
    var body: some View {
        NavigationView {
            
            /// Bringing in MasterView contents to the ContentView
            MasterView(formulaOneDrivers: formulaOneDrivers.first ?? FormulaOneDrivers(context: context))
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation {
                                /// Adding a new FormulaOneDriver
                                let formulaOneDriver = FormulaOneDriver(context: self.context)
                                formulaOneDriver.formulaOneDriver = self.formulaOneDrivers.first
                                
                                /// Saving the new FormulaOneDriver
                                try? self.context.save()
                            }
                        }
                        
                    ) {
                    Image(systemName: "plus")
                    })
        }
    }
}
