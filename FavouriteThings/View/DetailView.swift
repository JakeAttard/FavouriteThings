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
    
    var body: some View {
        
        VStack {
            Group {
                
                /// TextField for the name of the driver
                TextField(FormulaOneDriver.nameLabelPlaceholderText, text: $model.nameString)
                    .multilineTextAlignment(TextAlignment.center)
                    .font(Font.system(size: 40, weight: .bold, design: .serif))
                    .padding(.bottom, 20.0)
                
                HStack {
                    VStack {
                        TextField(FormulaOneDriver.teamNameLabelPlaceholderText, text: $model.labelTeam)
                            .font(Font.system(size: 15, weight: .medium, design: .serif))
                        
                        TextField(FormulaOneDriver.nationLabelPlaceholderText, text: $model.labelNation)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        
                        TextField(FormulaOneDriver.sponsorLabelPlaceholderText, text: $model.labelSponsor)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))
                        
                        TextField(FormulaOneDriver.notesLabelPlaceholderText, text: $model.labelNotes)
                        .font(Font.system(size: 15, weight: .medium, design: .serif))

                    }.padding(.leading)
                    
                    VStack {
                        TextField(FormulaOneDriver.teamNamePlaceholderText, text: $model.teamString)
                            .font(Font.system(size: 16, weight: .bold, design: .serif))
                        
                        TextField(FormulaOneDriver.nationPlaceholderText, text: $model.nationString)
                        .font(Font.system(size: 16, weight: .bold, design: .serif))
                        
                        TextField(FormulaOneDriver.sponsorPlaceholderText, text: $model.sponsorString)
                        .font(Font.system(size: 16, weight: .bold, design: .serif))
                        
                        TextField(FormulaOneDriver.notesPlaceholderText, text: $model.notesString)
                        .font(Font.system(size: 16, weight: .bold, design: .serif))
                    }.padding(.leading)
                }
                }.padding(.horizontal).fixedSize(horizontal: false, vertical: true)
        }
    }
}

