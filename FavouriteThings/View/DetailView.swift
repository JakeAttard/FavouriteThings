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
    /// Getting the context from the @Environment managedObjectContext
    @Environment(\.managedObjectContext) var context
    
    /// Calling the FormulaOneDriver in a new variable called model
    @ObservedObject var model: FormulaOneDriver
    
    var body: some View {
            VStack {
                ScrollView {
                    Group {
                    
                    /// Displaying the Formula One Driver Image in the View
                    self.model.updateImage()
                        .resizable()
                        .frame(width: 200.0, height: 200.0)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .scaledToFit()
                        .padding(.bottom, 30.0)
                    
                    /// TextField for the name of the driver
                    TextField(FormulaOneDriver.nameLabelPlaceholderText, text: $model.nameString)
                        .multilineTextAlignment(TextAlignment.center)
                        .font(Font.system(size: 40, weight: .bold, design: .serif))
                        .padding(.bottom, 10.0)
                    
                    NavigationLink( destination: LocationView(model: FormulaOneDriverMapViewDelegate(formulaOneDriver: self.model))) {
                        Text("🌏")
                        Text("Location: \(self.model.formulaOneDriverLocationName)")
                    }
                    .padding(.bottom, 20.0)
                    .font(Font.system(size: 20, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    
                    HStack {
                        VStack {
                            
                            /// TextField for the Image Label
                            TextField(FormulaOneDriver.imageLabelPlaceholderText, text: $model.labelImage)
                                .font(Font.system(size: 15, weight: .medium, design: .serif))
                            
                            /// TextField for the Team Name Label
                            TextField(FormulaOneDriver.teamNameLabelPlaceholderText, text: $model.labelTeam)
                                .font(Font.system(size: 15, weight: .medium, design: .serif))
                            
                            /// TextField for the Nation Label
                            TextField(FormulaOneDriver.nationLabelPlaceholderText, text: $model.labelNation)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                            
                            /// TextField for the Sponsor Label
                            TextField(FormulaOneDriver.sponsorLabelPlaceholderText, text: $model.labelSponsor)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                            
                            /// TextField for the Notes Label
                            TextField(FormulaOneDriver.notesLabelPlaceholderText, text: $model.labelNotes)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))

                        }
                        
                        VStack {
                            /// TextField for the Formula One Driver Image URL
                            TextField(FormulaOneDriver.imagePlaceholderText, text: $model.imageURLString)
                            .font(Font.system(size: 16, weight: .bold, design: .serif))
                            
                            /// TextField for the Formula One Driver Team Name
                            TextField(FormulaOneDriver.teamNamePlaceholderText, text: $model.teamString)
                                .font(Font.system(size: 16, weight: .bold, design: .serif))
                            
                            /// TextField for the Formula One Driver Nation
                            TextField(FormulaOneDriver.nationPlaceholderText, text: $model.nationString)
                            .font(Font.system(size: 16, weight: .bold, design: .serif))
                            
                            /// TextField for the Formula One Driver Sponsor
                            TextField(FormulaOneDriver.sponsorPlaceholderText, text: $model.sponsorString)
                            .font(Font.system(size: 16, weight: .bold, design: .serif))
                            
                            /// TextField for the Formula One Driver Notes
                            TextField(FormulaOneDriver.notesPlaceholderText, text: $model.notesString)
                            .font(Font.system(size: 16, weight: .bold, design: .serif))
                        }
                    }
                }.padding(.horizontal).fixedSize(horizontal: false, vertical: true)
            }
        }.modifier(Keyboard()).animation(.default)
    }
}
