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
    @Environment(\.managedObjectContext) var context
    @ObservedObject var model: FormulaOneDriver
    
    /// notes is a empty String where users can add additional information about there drivers
//    @State public var notes: String = ""
    
    var body: some View {
        
        VStack {
            Group {
                
                /// TextField for the name of the driver
                TextField("", text: $model.nameString)
                    .multilineTextAlignment(TextAlignment.center)
                    .font(Font.system(size: 40, weight: .bold, design: .serif))
                    .padding(.bottom, 20.0)
                    
                TextField("", text: $model.imageString)
                TextField("", text: $model.notesString)
                
//                /// Getting the current FormulaOneDriver Image
//                self.model.getFormulaOneDriverImage()
//                    .resizable()
//                    .frame(width: 300.0, height: 300.0)
//                    .clipShape(Circle())
//                    .shadow(radius: 10)
//                    .scaledToFit()
//                    .padding(.bottom, 20.0)
                    
//
//                HStack {
//
//                    VStack() {
//
//                        /// TextField for driverImage Label
//                        TextField(model.formulaOneDriverImageTitle, text:  self.$model.formulaOneDriverImageTitle)
//                        .font(Font.system(size: 15, weight: .medium, design: .serif))
//
//                        /// TextField for driverImage Label
//                        TextField(model.formulaOneDriverTeamTitle, text:  self.$model.formulaOneDriverTeamTitle)
//                        .font(Font.system(size: 15, weight: .medium, design: .serif))
//
//                        /// TextField for driverImage Label
//                        TextField(model.formulaOneDriverChampionshipsTitle, text:  self.$model.formulaOneDriverChampionshipsTitle)
//                        .font(Font.system(size: 15, weight: .medium, design: .serif))
//
//                        /// TextField for driverImage Label
//                        TextField(model.formulaOneDriverNotesTitle, text:  self.$model.formulaOneDriverNotesTitle)
//                        .font(Font.system(size: 15, weight: .medium, design: .serif))
//
//                    }.padding(.leading)
//
//                    VStack {
//
//                        /// Bringing in the TextField Placeholder for all the TextFields from the ViewModel
//
//
//
//                        /// TextField to updateFormulaOneDriverImage
//                        TextField("Image URL", text: self.$model.imageURL) {
//                            self.model.updateFormulaOneDriverImage(imageURL: self.model.imageURL)
//                        }
//                            .font(Font.system(size: 16, weight: .bold, design: .serif))
//
//                        /// TextField for formulaOneDriverTeam
//                        TextField(ViewModel.currentTeamPlaceholder, text: self.$model.formulaOneDriverTeam)
//                            .font(Font.system(size: 16, weight: .bold, design: .serif))
//
//                        /// TextField for formulaOneDriverChampionships
//                        TextField(ViewModel.titlesPlaceholder, value: self.$model.formulaOneDriverChampionships, formatter: NumberFormatter())
//                            .font(Font.system(size: 16, weight: .bold, design: .serif))
//
//                        TextField(ViewModel.addNotes, text: self.$model.formulaOneDriverNote)
//                        .font(Font.system(size: 16, weight: .bold, design: .serif))
//
//                    }.padding(.leading)
//                }
//            }.padding(.horizontal)
//                .fixedSize(horizontal: false, vertical: true)
//            }
            }
        }
    }
}

