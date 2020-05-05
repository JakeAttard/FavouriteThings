//
//  LocationView.swift
//  FavouriteThings
//
//  Created by Jake Attard on 6/5/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var place = Place()
    
    var body: some View {
        VStack {
            MapView(viewModel: place)
            HStack {
                Text("Name:")
                TextField("Enter Name", text: $place.name, onCommit: {
                    self.place.updateCoordinatesFromName()
                })
            }
            
            HStack {
                Text("Lat:")
                TextField("Enter Latitude", text: $place.latitude)
            }
            
            HStack {
                Text("Long")
                TextField("Enter Longitude", text: $place.longitude)
            }
            
            Button("Update Location Name") {
                self.place.updateNameFromCoordinates()
            }
            
            Spacer()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
