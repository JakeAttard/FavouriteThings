//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI

/**
 DetailView is what users will see when they click on the the FormulaOneDriver name from the ListView.
 This includes addition information about the driver career stats.
*/

struct DetailView: View {
    
    @ObservedObject var model: FormulaOneDriver
    @ObservedObject var viewModel: ViewModel
    
    /// notes is a empty String where users can add additional information about there drivers
    @State public var notes: String = ""
    
    var body: some View {
        
        VStack {
            Group {
                
                /// Getting the current FormulaOneDriver Image
                self.model.getFormulaOneDriverImage()
                    .resizable()
                    .frame(width: 300.0, height: 300.0)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .scaledToFit()
                    .padding(.bottom, 50.0)
                
                HStack {
                    
                    VStack() {
                        
                        /// TextField for driverName Label
                        TextField(ViewModel.driverNamePlaceholder, text:  self.$viewModel.driverName)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        
                        /// TextField for driverImage Label
                        TextField(ViewModel.driverImageLabelPlaceholder, text:  self.$viewModel.driverImage)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        
                        /// TextField for driver current team Label
                        TextField(ViewModel.currentTeamPlaceholder, text:  self.$viewModel.driverTeam)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        
                        /// TextField for driver titles Label
                        TextField(ViewModel.titlesPlaceholder, text:  self.$viewModel.driverTitles)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        
                        /// TextField for driver notes Label
                        TextField(ViewModel.notesPlaceholder, text:  self.$viewModel.driverNotes)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        
                    }.padding(.leading)
                    
                    VStack {
                        
                        /// Bringing in the TextField Placeholder for all the TextFields from the ViewModel
                        
                        /// TextField for formulaOneDriverName
                        TextField(ViewModel.driverNamePlaceholder, text:  self.$model.formulaOneDriverName)
                            .font(Font.system(size: 16, weight: .bold, design: .serif))
                        
                        /// TextField to updateFormulaOneDriverImage
                        TextField("Image URL", text: self.$model.formulaOneDriverImage) {
                            self.model.updateFormulaOneDriverImage(imageURL: self.model.formulaOneDriverImage)
                        }
                            .font(Font.system(size: 16, weight: .bold, design: .serif))
                        
                        /// TextField for formulaOneDriverTeam
                        TextField(ViewModel.currentTeamPlaceholder, text: self.$model.formulaOneDriverTeam)
                            .font(Font.system(size: 16, weight: .bold, design: .serif))
                        
                        /// TextField for formulaOneDriverChampionships
                        TextField(ViewModel.titlesPlaceholder, value: self.$model.formulaOneDriverChampionships, formatter: NumberFormatter())
                            .font(Font.system(size: 16, weight: .bold, design: .serif))
                        
                        TextField(ViewModel.addNotes, text: self.$model.formulaOneDriverNote)
                        .font(Font.system(size: 16, weight: .bold, design: .serif))
                        
                    }.padding(.leading)
                }
            }.padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
