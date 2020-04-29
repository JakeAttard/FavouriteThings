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
    @Environment(\.managedObjectContext) var context
    @ObservedObject var formulaOneDrivers: FormulaOneDrivers

    @Environment(\.editMode) var mode
    
    var body: some View {
        
        VStack {
            if mode?.wrappedValue == .active {
                HStack {
                    Text("📝")
                    TextField("Enter Title", text: self.$formulaOneDrivers.title ).font(Font.system(.largeTitle).bold())
                }
            }
            
            List {
                ForEach(formulaOneDrivers.entries, id: \.self) { formulaOneDriver in
                    NavigationLink(destination: DetailView(model: formulaOneDriver)) {
                        Section {
                            RowView(model: formulaOneDriver)
                        }
                    }
                }.onDelete { indices in
                    indices.forEach { self.formulaOneDrivers.removeFromFormulaOneDrivers(at: $0)
                        
                    }
                }.onMove { (indices, destination) in
                    self.formulaOneDrivers.entries.move(fromOffsets: indices, toOffset: destination)
                }
            }
        }.navigationBarTitle(mode?.wrappedValue == .active ? "": formulaOneDrivers.title ?? "")
    }
}
