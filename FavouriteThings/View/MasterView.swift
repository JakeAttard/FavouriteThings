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
    
    @ObservedObject var viewModel: ViewModel
//    @Binding var title: String
    @Environment(\.editMode) var mode
    
    var body: some View {
        
        VStack {
            if mode?.wrappedValue == .active {
                HStack {
                    Text("📝")
                    TextField("Enter Title", text: $viewModel.listTitle).font(Font.system(.largeTitle).bold())
                }
            }
            
            List {
                ForEach(viewModel.formulaOneDrivers) { formulaOneDriver in
                    NavigationLink(destination: DetailView(model: formulaOneDriver, viewModel: self.viewModel)) {
                        Section {
                            RowView(model: formulaOneDriver)
                        }
                    }
                }.onDelete { indices in
                    indices.forEach { self.viewModel.removeFormulaOneDriver(index: $0) }
                }.onMove { (indices, destination) in
                    self.viewModel.formulaOneDrivers.move(fromOffsets: indices, toOffset: destination)
                }
            }
        }.navigationBarTitle(mode?.wrappedValue == .active ? "": viewModel.listTitle)
    }
}
