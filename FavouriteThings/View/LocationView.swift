//
//  LocationView.swift
//  FavouriteThings
//
//  Created by Jake Attard on 6/5/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var model: FormulaOneDriverMapViewDelegate
    
    var body: some View {
        VStack {
            /// Calling the MapView in the LocationView
            MapView(model: model)
            
            ScrollView {
                HStack {
                    
                    /// Text locationName
                    Text(FormulaOneDriver.locationNameText)
                    
                    /// TextField for the Location Label
                    TextField(FormulaOneDriver.locationNameTextField, text: model.$formulaOneDriver.formulaOneDriverLocationName)
                }
                
                HStack {
                    /// Text latitude
                    Text(FormulaOneDriver.latitudeText)
                    
                    /// TextField for the latitude
                    TextField(FormulaOneDriver.latitudeTextField, text: $model.latitudeTextCoord, onCommit: {
                        self.model.updateNameFromCoordinates()
                    })
                }
                
                HStack {
                    /// Text Longitude
                    Text(FormulaOneDriver.longitudeText)
                    
                    /// TextField for the longitude
                    TextField(FormulaOneDriver.longitudeTextField, text: $model.longitudeTextCoord, onCommit: {
                        self.model.updateNameFromCoordinates()
                    })
                }
                
                /// Button updateLocationNameBtn
                Button(FormulaOneDriver.updateLocationNameBtn) {
                    self.model.updateCoordinatesFromName()
                }
                
                Spacer()
            }
        }.modifier(Keyboard()).animation(.default)
        .navigationBarTitle("", displayMode: .inline)
    }
}
