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
                        
                        /// Bringing in the Driver Name text from the ViewModel
                        Text(ViewModel.driveName)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Driver  Image text from the ViewModel
                        Text(ViewModel.image)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Driver Country text from the ViewModel
                        Text(ViewModel.country)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Current Team text from the ViewModel
                        Text(ViewModel.currentTeam)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Titles text from the ViewModel
                        Text(ViewModel.titles)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Race Wins text from the ViewModel
                        Text(ViewModel.raceWins)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Driver Podiums text from the ViewModel
                        Text(ViewModel.podiums)
                            .fontWeight(.bold)
                            .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Pole Positions text from the ViewModel
                        Text(ViewModel.polePositions)
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
                            
                        
                        /// TextField for formulaOneDriverNationality
                        TextField(ViewModel.countryPlaceholder, text: self.$model.formulaOneDriverNationality)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverTeam
                        TextField(ViewModel.currentTeamPlaceholder, text: self.$model.formulaOneDriverTeam)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverChampionships
                        TextField(ViewModel.titlesPlaceholder, value: self.$model.formulaOneDriverChampionships, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverRaceWins
                        TextField(ViewModel.raceWinsPlaceholder, value: self.$model.formulaOneDriverRaceWins, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverPodiums
                        TextField(ViewModel.podiumsPlaceholder, value: self.$model.formulaOneDriverPodiums, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverPolePositions
                        TextField(ViewModel.polePositionsPlaceholder, value: self.$model.formulaOneDriverPolePositions, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding(.leading)
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        /// Bringing in the Race Starts text from the ViewModel
                        Text(ViewModel.raceStarts)
                        .fontWeight(.bold)
                         .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Fastest Laps text from the ViewModel
                        Text(ViewModel.fastestLaps)
                        .fontWeight(.bold)
                         .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Laps Completed text from the ViewModel
                        Text(ViewModel.lapsCompleted)
                        .fontWeight(.bold)
                         .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Career Points text from the ViewModel
                        Text(ViewModel.careerPoints)
                        .fontWeight(.bold)
                         .frame(maxHeight: .infinity)
                        
                        /// Bringing in the Notes text from the ViewModel
                        Text(ViewModel.notes)
                        .fontWeight(.bold)
                         .frame(maxHeight: .infinity)
                    }
                    
                    /// TextField Labels positioned on the right
                    VStack {
                        
                        /// TextField for formulaOneDriverRaceStarts
                        TextField(ViewModel.raceStartsPlaceholder, value: self.$model.formulaOneDriverRaceStarts, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverFastestLaps
                        TextField(ViewModel.fastestLapsPlaceholder, value: self.$model.formulaOneDriverFastestLaps, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverLapsCompleted
                        TextField(ViewModel.lapsCompletedPlaceholder, value: self.$model.formulaOneDriverLapsCompleted, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        /// TextField for formulaOneDriverCareerPoints
                        TextField(ViewModel.careerPointsPlaceholder, value: self.$model.formulaOneDriverCareerPoints, formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField(ViewModel.addNotes, text: self.$model.formulaOneDriverNote)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding(.leading)
                }
                

            }.padding(.horizontal)
                .fixedSize(horizontal: false, vertical: true)
            
                
            HStack {
                /// Bringing in the Disclaimer text from the ViewModel
                Text(ViewModel.disclaimer)
                .fontWeight(.light)
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
            }
        }
    }
}
