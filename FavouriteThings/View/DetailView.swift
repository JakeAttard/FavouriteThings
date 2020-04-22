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
    
    /// url is a empty String for the formulaOneDriverImage
    @State var url: String = ""
    
    /// notes is a empty String where users can add additional information about there drivers
    @State public var notes: String = ""
    
    var body: some View {
        
        VStack {
            Group {
                
                /// Getting the current FormulaOneDriver Image
                self.model.getFormulaOneDriverImage()
                    .resizable()
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .scaledToFit()
                    .padding(.bottom, 10.0)
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        /// TextField for driverName Label
                        TextField(ViewModel.driverNamePlaceholder, text:  self.$viewModel.driverName)
                        
                        /// TextField for driverImage Label
                        TextField(ViewModel.driverImageLabelPlaceholder, text:  self.$viewModel.driverImage)
                        
                        /// Bringing in the Current Team text from the ViewModel
                        Text(ViewModel.currentTeam)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Titles text from the ViewModel
                        Text(ViewModel.titles)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity)
                    }
                    
                    VStack {
                        
                        /// Bringing in the TextField Placeholder for all the TextFields from the ViewModel
                        
                        /// TextField for formulaOneDriverName
                        TextField(ViewModel.driverNamePlaceholder, text:  self.$model.formulaOneDriverName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField to updateFormulaOneDriverImage
                        TextField("Image URL", text: self.$url) {
                            self.model.updateFormulaOneDriverImage(imageURL: self.url)
                        }
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverTeam
                        TextField(ViewModel.currentTeamPlaceholder, text: self.$model.formulaOneDriverTeam)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverChampionships
                        TextField(ViewModel.titlesPlaceholder, value: self.$model.formulaOneDriverChampionships, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding(.leading)
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        /// Bringing in the Notes text from the ViewModel
                        Text(ViewModel.notes)
                        .fontWeight(.bold)
                         .frame(maxHeight: .infinity)
                    }
                    
                    /// TextField Labels positioned on the right
                    VStack {
                        
                        TextField(ViewModel.addNotes, text: self.$model.formulaOneDriverNote)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding(.leading)
                }
                

            }.padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
