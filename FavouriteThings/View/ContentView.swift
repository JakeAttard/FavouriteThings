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
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FormulaOneDrivers.listTitle, ascending: true)]) var formulaOneDrivers: FetchedResults<FormulaOneDrivers>
    
    var body: some View {
        NavigationView {
            
            /// Bringing in MasterView contents
            MasterView(formulaOneDrivers: formulaOneDrivers.first ?? FormulaOneDrivers(context: context))
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: Button(
                        action: {
                            withAnimation {
                                let formulaOneDriver = FormulaOneDriver(context: self.context)
                                formulaOneDriver.formulaOneDriver = self.formulaOneDrivers.first
                                try? self.context.save()
                            }
                        }
                        
                    ) {
                    Image(systemName: "plus")
                    })
        }
    }
}
