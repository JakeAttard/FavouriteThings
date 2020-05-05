//
//  MasterView.swift
//  FavouriteThings
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI

/**
    MasterView is the first view users will see when they load up the Referencer application.
    In the Section passing through the RowView file
*/

struct MasterView: View {
    /// Getting the context from the @Environment managedObjectContext
    @Environment(\.managedObjectContext) var context
    
    /// Calling FormulaOneDrivers in a variable formulaOneDrivers
    @ObservedObject var formulaOneDrivers: FormulaOneDrivers
    
    /// Getting the mode from the @Enviroment editMode
    @Environment(\.editMode) var mode
    
    var body: some View {
        
        VStack {
            if mode?.wrappedValue == .active {
                /// ListTitle
                HStack {
                    /// List Title Icon
                    Text("📝")
                    /// List Title TextField
                    TextField(FormulaOneDriver.listTitlePlaceholderText, text: self.$formulaOneDrivers.title ).font(Font.system(.largeTitle).bold())
                }
            }
            HStack {
                Spacer()
                Button("Sort A-Z") {
                    self.formulaOneDrivers.sortAlphabetically()
                }
                
                Spacer()
                
                Button("Sort Z-A") {
                    self.formulaOneDrivers.sortInReverseOrder()
                }
                
                Spacer()
            }
            
            /// List
            List {
                ForEach(formulaOneDrivers.entries, id: \.self) { formulaOneDriver in
                    NavigationLink(destination: DetailView(model: formulaOneDriver)) {
                        Section {
                            /// Bringing in the RowView
                            RowView(model: formulaOneDriver)
                        }
                    }
                }
                /// Deleting a formulaOneDriver from the List
                .onDelete { indices in
                    indices.forEach { self.formulaOneDrivers.removeFromFormulaOneDrivers(at: $0)
                        
                    }
                }
                /// Moving a formulaOneDriver in the list and reordering it
                .onMove { (indices, destination) in
                    self.formulaOneDrivers.entries.move(fromOffsets: indices, toOffset: destination)
                }
            }
        }
        /// NavigationBarTitle and calling the formulaOneDrivers.title
        .navigationBarTitle(mode?.wrappedValue == .active ? "": formulaOneDrivers.title )
    }
}
