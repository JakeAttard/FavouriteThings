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
            MapView(model: model)
            ScrollView {
                
                HStack {
                    Text("Location Name:")
                    TextField("Enter Name", text: model.$formulaOneDriver.formulaOneDriverLocationName)
                }
                
                HStack {
                    Text("Latitude:")
                    TextField("Enter Latitude", text: $model.latitudeTextCoord, onCommit: {
                        self.model.updateNameFromCoordinates()
                    })
                }
                
                HStack {
                    Text("Longitude:")
                    TextField("Enter Longitude", text: $model.longitudeTextCoord, onCommit: {
                        self.model.updateNameFromCoordinates()
                    })
                }
                
                Button("Update Location Name") {
                    self.model.updateCoordinatesFromName()
                }
                
                Spacer()
            }
        }.modifier(Keyboard()).animation(.default)
        .navigationBarTitle("", displayMode: .inline)
    }
}
